import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../hub_state.dart';
import 'rename_dialog.dart';

class SelectorOptionsSheet extends StatelessWidget {
  const SelectorOptionsSheet({
    super.key,
    required this.state,
    required this.sourceId,
    required this.capabilityId,
    required this.onRename,
    required this.onSetHidden,
  });

  final ValueListenable<HubState> state;
  final String sourceId;
  final String capabilityId;
  final void Function(String optionId, String title) onRename;
  final void Function(String optionId, bool hidden) onSetHidden;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HubState>(
      valueListenable: state,
      builder: (context, s, _) {
        final selector = s.selector(sourceId, capabilityId);
        if (selector == null) return const SizedBox.shrink();

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: Text(
                  'Входы: ${selector.title}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              for (final option in selector.options)
                ListTile(
                  leading: IconButton(
                    tooltip: option.hidden ? 'Показать' : 'Скрыть',
                    icon: Icon(option.hidden ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => onSetHidden(option.id, !option.hidden),
                  ),
                  title: Text(option.title),
                  subtitle: option.hidden ? const Text('Скрыт') : null,
                  trailing: IconButton(
                    tooltip: 'Переименовать',
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () async {
                      final title = await showRenameDialog(context, option.title);
                      if (title != null) onRename(option.id, title);
                    },
                  ),
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
