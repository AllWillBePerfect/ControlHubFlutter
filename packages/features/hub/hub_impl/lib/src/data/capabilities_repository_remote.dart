import 'package:core/network/agent_api_client.dart';
import 'package:core/network/agent_api_models.dart';
import 'package:core/utils/result.dart';
import 'package:hub_api/hub_api.dart';
import 'package:sources_api/sources_api.dart';

import 'capabilities_repository.dart';

typedef AgentApiClientFactory = AgentApiClient Function(Source source, String token);

class CapabilitiesRepositoryRemote implements CapabilitiesRepository {
  CapabilitiesRepositoryRemote({
    required this._sourcesRepository,
    AgentApiClientFactory? clientFactory,
  })  : _clientFactory = clientFactory ?? _defaultClient;

  final SourcesRepository _sourcesRepository;
  final AgentApiClientFactory _clientFactory;

  static AgentApiClient _defaultClient(Source source, String token) =>
      AgentApiClient(host: source.host, port: source.port, token: token);

  @override
  Future<Result<List<Capability>>> getCapabilities(Source source) async {
    final client = await _client(source);
    return client.flatMap((api) async {
      final response = await api.getCapabilities();
      return response.map((r) => [for (final c in r.capabilities) _toDomain(c)]);
    });
  }

  @override
  Future<Result<Capability>> execute(
    Source source,
    String capabilityId,
    CapabilityCommand command,
  ) async {
    final client = await _client(source);
    return client.flatMap((api) async {
      final response = await api.execute(capabilityId, _toApi(command));
      return response.map(_toDomain);
    });
  }

  Future<Result<AgentApiClient>> _client(Source source) async {
    final token = await _sourcesRepository.getToken(source.id);
    return token.map((t) => _clientFactory(source, t));
  }

  static Capability _toDomain(CapabilityApiModel model) => switch (model) {
        SelectorApiModel m => SelectorCapability(
            id: m.id,
            title: m.title,
            options: [
              for (final o in m.options)
                CapabilityOption(id: o.id, title: o.title, hidden: o.hidden),
            ],
            selectedId: m.selectedId,
          ),
        GaugeApiModel m => GaugeCapability(
            id: m.id,
            title: m.title,
            value: m.value,
            min: m.min,
            max: m.max,
            unit: m.unit,
          ),
        ToggleApiModel m => ToggleCapability(id: m.id, title: m.title, isOn: m.isOn),
        SliderApiModel m => SliderCapability(
            id: m.id,
            title: m.title,
            value: m.value,
            min: m.min,
            max: m.max,
            step: m.step,
          ),
      };

  static CommandApiModel _toApi(CapabilityCommand command) => switch (command) {
        SelectOption(:final optionId) => CommandApiModel.select(optionId: optionId),
        SetToggle(:final isOn) => CommandApiModel.toggle(isOn: isOn),
        SetValue(:final value) => CommandApiModel.value(value: value),
      };

        @override
  Future<Result<Capability>> updateOption(
    Source source,
    String capabilityId,
    String optionId, {
    String? title,
    bool? hidden,
  }) async {
    final client = await _client(source);
    return client.flatMap((api) async {
      final response = await api.updateOption(
        capabilityId,
        optionId,
        title: title,
        hidden: hidden,
      );
      return response.map(_toDomain);
    });
  }
}
