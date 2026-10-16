import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../utils/failure.dart';
import '../utils/result.dart';
import 'agent_api_models.dart';

class AgentApiClient {
  AgentApiClient({
    required this._host,
    required this._port,
    required this._token,
    HttpClient Function()? clientFactory,
  })  : _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final String _token;
  final HttpClient Function() _clientFactory;

  static const _connectTimeout = Duration(seconds: 3);
  static const _responseTimeout = Duration(seconds: 8);

  Future<Result<CapabilitiesResponse>> getCapabilities() =>
      _send('GET', '/api/capabilities', null, CapabilitiesResponse.fromJson);

  Future<Result<CapabilityApiModel>> execute(String capabilityId, CommandApiModel command) =>
      _send('POST', '/api/capabilities/$capabilityId', command.toJson(),
          CapabilityApiModel.fromJson);

  Future<Result<CapabilityApiModel>> updateOption(
    String capabilityId,
    String optionId, {
    String? title,
    bool? hidden,
  }) =>
      _send(
        'PUT',
        '/api/capabilities/$capabilityId/options/$optionId',
        {
          'title': ?title,
          'hidden': ?hidden,
        },
        CapabilityApiModel.fromJson,
      );

  Future<Result<T>> _send<T>(
    String method,
    String path,
    Map<String, Object?>? body,
    T Function(Map<String, Object?> json) parse,
  ) async {
    final client = _clientFactory()..connectionTimeout = _connectTimeout;
    try {
      final request = await client.openUrl(
        method,
        Uri(scheme: 'http', host: _host, port: _port, path: path),
      );
      request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $_token');
      if (body != null) {
        request.headers.contentType = ContentType.json;
        request.write(jsonEncode(body));
      }

      final response = await request.close().timeout(_responseTimeout);
      final text = await response.transform(utf8.decoder).join();

      return switch (response.statusCode) {
        200 => Result.ok(parse(jsonDecode(text) as Map<String, Object?>)),
        401 => Result.error(const UnauthorizedFailure()),
        404 => Result.error(NotFoundFailure(path)),
        _ => Result.error(UnknownFailure('HTTP ${response.statusCode}: $text')),
      };
    } on SocketException {
      return Result.error(UnreachableFailure('$_host:$_port'));
    } on TimeoutException {
      return Result.error(const TimeoutFailure());
    } catch (e) {
      return Result.error(UnknownFailure(e));
    } finally {
      client.close();
    }
  }
}
