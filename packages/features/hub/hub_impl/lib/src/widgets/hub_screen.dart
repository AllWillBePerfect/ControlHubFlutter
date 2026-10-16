import 'package:core/ui/failure_message.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sources_api/sources_api.dart';
import 'selector_options_sheet.dart';

import '../hub_state.dart';
import '../hub_viewmodel.dart';
import 'source_section.dart';

class HubScreen extends StatefulWidget {
  const HubScreen({super.key, required this.viewModel});

  final HubViewModel viewModel;

  @override
  State<HubScreen> createState() => _HubScreenState();
}

class _HubScreenState extends State<HubScreen> {
    @override
  void initState() {
    super.initState();
    _subscribe(widget.viewModel);
  }

  @override
  void didUpdateWidget(covariant HubScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      _unsubscribe(oldWidget.viewModel);
      _subscribe(widget.viewModel);
    }
  }

  @override
  void dispose() {
    _unsubscribe(widget.viewModel);
    super.dispose();
  }

  void _subscribe(HubViewModel vm) {
    vm.load.addListener(_onLoadResult);
    vm.execute.addListener(_onExecuteResult);
    vm.updateOption.addListener(_onUpdateOptionResult);
    vm.startPolling();
  }

  void _unsubscribe(HubViewModel vm) {
    vm.load.removeListener(_onLoadResult);
    vm.execute.removeListener(_onExecuteResult);
    vm.updateOption.removeListener(_onUpdateOptionResult);
    vm.stopPolling();
  }

  Future<void> _open(String path) async {
  widget.viewModel.stopPolling();
  await context.push(path);
  if (!mounted) return;
  widget.viewModel
    ..load.execute()
    ..startPolling();
}

  void _openOptions(String sourceId, String capabilityId) {
    final vm = widget.viewModel;
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => SelectorOptionsSheet(
        state: vm.state,
        sourceId: sourceId,
        capabilityId: capabilityId,
        onRename: (optionId, title) => vm.updateOption.execute((
          sourceId: sourceId,
          capabilityId: capabilityId,
          optionId: optionId,
          title: title,
          hidden: null,
        )),
        onSetHidden: (optionId, hidden) => vm.updateOption.execute((
          sourceId: sourceId,
          capabilityId: capabilityId,
          optionId: optionId,
          title: null,
          hidden: hidden,
        )),
      ),
    );
  }

  void _onUpdateOptionResult() {
    final failure = widget.viewModel.updateOptionFailure;
    if (failure != null) {
      widget.viewModel.updateOption.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failureMessage(failure))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ControlHub'),
        actions: [
          ListenableBuilder(
            listenable: vm.load,
            builder: (context, _) => IconButton(
              tooltip: 'Обновить',
              icon: const Icon(Icons.refresh),
              onPressed: vm.load.running ? null : vm.load.execute,
            ),
          ),
          IconButton(
            tooltip: 'Источники',
            icon: const Icon(Icons.settings),
            onPressed: () => _open(SourcesPaths.list),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: vm.load,
        builder: (context, child) {
          if (vm.showInitialLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.showInitialError) {
            return _Message(
              icon: Icons.cloud_off,
              text: 'Не удалось загрузить',
              actionLabel: 'Повторить',
              onAction: vm.load.execute,
            );
          }
          return child!;
        },
        child: ValueListenableBuilder<HubState>(
          valueListenable: vm.state,
          builder: (context, state, _) {
            if (!state.hasSources) {
              return _Message(
                icon: Icons.settings_ethernet,
                text: 'Нет источников',
                actionLabel: 'Добавить',
                onAction: () => _open(SourcesPaths.add),
              );
            }
            return RefreshIndicator(
              onRefresh: vm.load.execute,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  for (final section in state.sections) ...[
                    SourceSectionView(
                      section: section,
                      state: state,
                      onCommand: (capabilityId, command) => widget.viewModel.execute.execute((
                        sourceId: section.source.id,
                        capabilityId: capabilityId,
                        command: command,
                      )),
                      onEditOptions: (capabilityId) =>
                          _openOptions(section.source.id, capabilityId),
                    ),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onLoadResult() {
    if (widget.viewModel.refreshFailed) {
      widget.viewModel.load.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось обновить')),
      );
    }
  }

  void _onExecuteResult() {
    final failure = widget.viewModel.executeFailure;
    if (failure != null) {
      widget.viewModel.execute.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failureMessage(failure))),
      );
    }
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.icon,
    required this.text,
    required this.actionLabel,
    required this.onAction,
  });

  final IconData icon;
  final String text;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64),
          const SizedBox(height: 16),
          Text(text, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          FilledButton.tonal(onPressed: onAction, child: Text(actionLabel)),
        ],
      ),
    );
  }
}
