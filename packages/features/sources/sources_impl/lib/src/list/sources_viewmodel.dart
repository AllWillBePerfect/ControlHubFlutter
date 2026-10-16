import 'package:core/ui/view_model.dart';
import 'package:flutter/foundation.dart';

import 'package:core/utils/command.dart';
import 'package:core/utils/result.dart';
import 'package:sources_api/sources_api.dart';

import 'sources_state.dart';

class SourcesViewModel implements ViewModel {
  SourcesViewModel({required SourcesRepository sourcesRepository})
      : _repository = sourcesRepository {
    load = Command0(_load)..execute();
    remove = Command1(_remove);
  }

  final SourcesRepository _repository;

  final _state = ValueNotifier(const SourcesState());
  ValueListenable<SourcesState> get state => _state;

  late final Command0<void> load;
  late final Command1<void, String> remove;

  bool get showInitialLoading => load.running && !_state.value.hasSources;
  bool get showInitialError => load.failed && !_state.value.hasSources;
  bool get removeFailed => remove.failed;

  Future<Result<void>> _load() async {
    final result = await _repository.getAll();
    if (result case Ok(:final value)) {
      _state.value = _state.value.copyWith(sources: value);
    }
    return result;
  }

  Future<Result<void>> _remove(String id) async {
    final result = await _repository.remove(id);
    if (result case Ok()) {
      _state.value = _state.value.copyWith(sources: [
        for (final s in _state.value.sources)
          if (s.id != id) s,
      ]);
    }
    return result;
  }

  void dispose() {
    load.dispose();
    remove.dispose();
    _state.dispose();
  }
}
