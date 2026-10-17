import 'package:core/ui/failure_message.dart';
import 'package:flutter/material.dart';
import 'package:hub_api/hub_api.dart';

import '../hub_state.dart';
import 'cards/capability_card.dart';

class SourceSectionView extends StatelessWidget {
  const SourceSectionView({
    super.key,
    required this.section,
    required this.state,
    required this.onCommand,
    required this.onEditOptions,
  });

  final SourceSection section;
  final HubState state;
  final void Function(String capabilityId, CapabilityCommand command) onCommand;
  final void Function(String capabilityId) onEditOptions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final source = section.source;
    final failure = section.failure;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
  children: [
    _StatusDot(online: section.isOnline),
    const SizedBox(width: 8),
    Expanded(child: Text(source.name, style: theme.textTheme.titleLarge)),
  ],
),
        Text('${source.host}:${source.port}', style: theme.textTheme.bodySmall),
        if (failure != null)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              failureMessage(failure),
              style: TextStyle(color: theme.colorScheme.onErrorContainer),
            ),
          ),
        const SizedBox(height: 8),
        for (final c in section.capabilities)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CapabilityCard(
              capability: c,
              busy: state.isExecuting(source.id, c.id),
              enabled: !state.isExecutingAny,
              onCommand: (cmd) => onCommand(c.id, cmd),
              onEditOptions: () => onEditOptions(c.id),
            ),
          ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({required this.online});

  final bool online;

  @override
  Widget build(BuildContext context) {
    final color = online ? Colors.green : Theme.of(context).colorScheme.error;
    return Tooltip(
      message: online ? 'На связи' : 'Нет связи',
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
