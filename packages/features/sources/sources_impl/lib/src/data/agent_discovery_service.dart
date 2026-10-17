import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:core/network/agent_protocol.dart';
import 'package:core/utils/result.dart';

class DiscoveredAgent {
  const DiscoveredAgent({required this.name, required this.host, required this.port});

  final String name;
  final String host;
  final int port;
}

class AgentDiscoveryService {
  AgentDiscoveryService({
    this.discoveryPort = AgentProtocol.discoveryPort,
    this.timeout = const Duration(seconds: 2),
  });

  final int discoveryPort;
  final Duration timeout;

  Future<Result<List<DiscoveredAgent>>> discover() => runCatching(() async {
        final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
        socket.broadcastEnabled = true;

        final found = <String, DiscoveredAgent>{};
        final sub = socket.listen((event) {
          if (event != RawSocketEvent.read) return;
          final dg = socket.receive();
          if (dg == null) return;
          try {
            final json = jsonDecode(utf8.decode(dg.data)) as Map<String, dynamic>;
            final host = dg.address.address;
            final port = json['port'] as int;
            found['$host:$port'] =
                DiscoveredAgent(name: json['agent'] as String, host: host, port: port);
          } catch (_) {
          }
        });

        try {
          final msg = utf8.encode('DESKSWITCH_DISCOVER');
          for (var i = 0; i < 3; i++) {
            socket.send(msg, InternetAddress('255.255.255.255'), discoveryPort);
            await Future<void>.delayed(const Duration(milliseconds: 200));
          }
          await Future<void>.delayed(timeout);
        } finally {
          await sub.cancel();
          socket.close();
        }
        return found.values.toList();
      });
}
