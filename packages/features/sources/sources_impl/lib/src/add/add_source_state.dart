import 'package:flutter/foundation.dart';

import '../data/agent_discovery_service.dart';

@immutable
class AddSourceState {
  const AddSourceState({this.found = const [], this.searched = false});

  final List<DiscoveredAgent> found;

  final bool searched;

  bool get hasFound => found.isNotEmpty;
  bool get nothingFound => searched && found.isEmpty;

  AddSourceState copyWith({List<DiscoveredAgent>? found, bool? searched}) =>
      AddSourceState(found: found ?? this.found, searched: searched ?? this.searched);
}
