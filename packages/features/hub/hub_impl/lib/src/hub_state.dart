import 'package:core/utils/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:hub_api/hub_api.dart';
import 'package:sources_api/sources_api.dart';

@immutable
class SourceSection {
  const SourceSection({
    required this.source,
    this.capabilities = const [],
    this.failure,
  });

  final Source source;

  final List<Capability> capabilities;
  final Failure? failure;

  bool get hasCapabilities => capabilities.isNotEmpty;
  bool get hasFailure => failure != null;
  bool get isOnline => failure == null;

  SourceSection replace(Capability updated) => SourceSection(
        source: source,
        capabilities: [
          for (final c in capabilities) c.id == updated.id ? updated : c,
        ],
        failure: failure,
      );
}

@immutable
class HubState {
  const HubState({this.sections = const [], this.executingKey});

  final List<SourceSection> sections;

  final String? executingKey;

  bool get hasSources => sections.isNotEmpty;
  bool get isExecutingAny => executingKey != null;

  bool isExecuting(String sourceId, String capabilityId) =>
      executingKey == '$sourceId/$capabilityId';

  SourceSection? sectionFor(String sourceId) {
    for (final s in sections) {
      if (s.source.id == sourceId) return s;
    }
    return null;
  }

  HubState copyWith({
    List<SourceSection>? sections,
    String? executingKey,
    bool clearExecuting = false,
  }) =>
      HubState(
        sections: sections ?? this.sections,
        executingKey: clearExecuting ? null : (executingKey ?? this.executingKey),
      );

        SelectorCapability? selector(String sourceId, String capabilityId) {
    final section = sectionFor(sourceId);
    if (section == null) return null;
    for (final c in section.capabilities) {
      if (c.id == capabilityId && c is SelectorCapability) return c;
    }
    return null;
  }
}
