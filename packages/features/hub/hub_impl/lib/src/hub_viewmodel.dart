import 'dart:async';

import 'package:core/ui/view_model.dart';
import 'package:core/utils/command.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/result.dart';
import 'package:flutter/foundation.dart';
import 'package:hub_api/hub_api.dart';
import 'package:sources_api/sources_api.dart';

import 'data/capabilities_repository.dart';
import 'hub_state.dart';

typedef ExecuteArgs = ({
  String sourceId,
  String capabilityId,
  CapabilityCommand command,
});

typedef UpdateOptionArgs = ({
  String sourceId,
  String capabilityId,
  String optionId,
  String? title,
  bool? hidden,
});

class HubViewModel implements ViewModel {
  HubViewModel({
    required this._sourcesRepository,
    required this._capabilitiesRepository,
  }) {
    load = Command0(_load)..execute();
    execute = Command1(_execute);
    updateOption = Command1(_updateOption);
  }

   late final Command1<void, UpdateOptionArgs> updateOption;

  Failure? get updateOptionFailure => updateOption.result?.failureOrNull;

  Future<Result<void>> _updateOption(UpdateOptionArgs args) async {
    final section = _state.value.sectionFor(args.sourceId);
    if (section == null) return Result.error(NotFoundFailure(args.sourceId));

    final result = await _capabilitiesRepository.updateOption(
      section.source,
      args.capabilityId,
      args.optionId,
      title: args.title,
      hidden: args.hidden,
    );
    if (result case Ok(:final value)) _replace(args.sourceId, value);
    return result;
  }

  void _replace(String sourceId, Capability updated) {
    final current = _state.value;
    _state.value = current.copyWith(sections: [
      for (final s in current.sections)
        s.source.id == sourceId ? s.replace(updated) : s,
    ]);
  }

  final SourcesRepository _sourcesRepository;
  final CapabilitiesRepository _capabilitiesRepository;

  final _state = ValueNotifier(const HubState());
  ValueListenable<HubState> get state => _state;

  late final Command0<void> load;
  late final Command1<void, ExecuteArgs> execute;

  static const pollInterval = Duration(seconds: 5);
  Timer? _pollTimer;

  bool get showInitialLoading => load.running && !_state.value.hasSources;
  bool get showInitialError => load.failed && !_state.value.hasSources;
  bool get refreshFailed => load.failed && _state.value.hasSources;
  Failure? get executeFailure => execute.result?.failureOrNull;

  void startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(pollInterval, (_) => load.execute());
  }

  void stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  Future<Result<void>> _load() async {
    final sources = await _sourcesRepository.getAll();
    if (sources case Err(:final failure)) return Result.error(failure);
    final list = sources.valueOrNull!;

    final results = await Future.wait(list.map(_capabilitiesRepository.getCapabilities));

    _state.value = _state.value.copyWith(sections: [
      for (var i = 0; i < list.length; i++)
        switch (results[i]) {
          Ok(value: final caps) => SourceSection(source: list[i], capabilities: caps),
          Err(:final failure) => SourceSection(
              source: list[i],
              capabilities: _state.value.sectionFor(list[i].id)?.capabilities ?? const [],
              failure: failure,
            ),
        },
    ]);
    return const Result.ok(null);
  }

  Future<Result<void>> _execute(ExecuteArgs args) async {
    final section = _state.value.sectionFor(args.sourceId);
    if (section == null) return Result.error(NotFoundFailure(args.sourceId));

    _state.value = _state.value.copyWith(
      executingKey: '${args.sourceId}/${args.capabilityId}',
    );

    final result = await _capabilitiesRepository.execute(
      section.source,
      args.capabilityId,
      args.command,
    );

    final current = _state.value;
    _state.value = current.copyWith(
      clearExecuting: true,
      sections: switch (result) {
        Ok(:final value) => [
            for (final s in current.sections)
              s.source.id == args.sourceId ? s.replace(value) : s,
          ],
        Err() => null,
      },
    );
    return result;
  }

  @override
  void dispose() {
    stopPolling();
    load.dispose();
    execute.dispose();
    _state.dispose();
    updateOption.dispose();
  }
}
