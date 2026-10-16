import 'package:core/ui/view_model.dart';
import 'package:flutter/foundation.dart';

import 'package:core/utils/command.dart';
import 'package:core/utils/result.dart';
import 'package:sources_api/sources_api.dart';

import '../data/agent_discovery_service.dart';
import 'add_source_state.dart';

typedef AddSourceInput = ({String name, String host, String port, String token});

class AddSourceViewModel implements ViewModel {
  AddSourceViewModel({
    required SourcesRepository sourcesRepository,
    required this._discovery,
  })  : _repository = sourcesRepository {
    discover = Command0(_discover);
    save = Command1(_save);
  }

  final SourcesRepository _repository;
  final AgentDiscoveryService _discovery;

  final _state = ValueNotifier(const AddSourceState());
  ValueListenable<AddSourceState> get state => _state;

  late final Command0<void> discover;
  late final Command1<void, AddSourceInput> save;

  bool get saved => save.completed;
  bool get saveFailed => save.failed;
  bool get discoverFailed => discover.failed;

  String? validateName(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Введите имя' : null;

  String? validateHost(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Введите адрес' : null;

  String? validatePort(String? v) {
    final port = int.tryParse(v?.trim() ?? '');
    return (port == null || port < 1 || port > 65535) ? 'Порт от 1 до 65535' : null;
  }

  String? validateToken(String? v) =>
      (v == null || v.trim().length < 16) ? 'Минимум 16 символов' : null;

  Future<Result<void>> _discover() async {
    final result = await _discovery.discover();
    if (result case Ok(:final value)) {
      _state.value = _state.value.copyWith(found: value, searched: true);
    }
    return result;
  }

  Future<Result<void>> _save(AddSourceInput input) {
    final host = input.host.trim();
    final port = int.parse(input.port.trim());
    final source = Source(
      id: Source.idFor(host, port),
      name: input.name.trim(),
      host: host,
      port: port,
    );
    return _repository.save(source, token: input.token.trim());
  }

  void dispose() {
    discover.dispose();
    save.dispose();
    _state.dispose();
  }
}
