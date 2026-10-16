import 'package:flutter/foundation.dart';

import 'package:sources_api/sources_api.dart';

@immutable
class SourcesState {
  const SourcesState({this.sources = const []});

  final List<Source> sources;

  bool get hasSources => sources.isNotEmpty;

  SourcesState copyWith({List<Source>? sources}) =>
      SourcesState(sources: sources ?? this.sources);
}
