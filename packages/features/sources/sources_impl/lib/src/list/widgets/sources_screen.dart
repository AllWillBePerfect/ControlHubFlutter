import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sources_api/sources_api.dart';

import '../sources_state.dart';
import '../sources_viewmodel.dart';

class SourcesScreen extends StatefulWidget {
  const SourcesScreen({super.key, required this.viewModel});

  final SourcesViewModel viewModel;

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.remove.addListener(_onRemoveResult);
  }

  @override
  void didUpdateWidget(covariant SourcesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.remove.removeListener(_onRemoveResult);
      widget.viewModel.remove.addListener(_onRemoveResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.remove.removeListener(_onRemoveResult);
    super.dispose();
  }

  Future<void> _openAdd() async {
    await context.push(SourcesPaths.add);
    widget.viewModel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Scaffold(
      appBar: AppBar(title: const Text('Источники')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Добавить',
        onPressed: _openAdd,
        child: const Icon(Icons.add),
      ),
      body: ListenableBuilder(
        listenable: vm.load,
        builder: (context, child) {
          if (vm.showInitialLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.showInitialError) {
            return Center(
              child: FilledButton.tonal(
                onPressed: vm.load.execute,
                child: const Text('Не удалось загрузить. Повторить'),
              ),
            );
          }
          return child!;
        },
        child: ValueListenableBuilder<SourcesState>(
          valueListenable: vm.state,
          builder: (context, state, _) {
            if (!state.hasSources) {
              return const Center(child: Text('Пока нет источников'));
            }
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final source in state.sources)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.computer),
                      title: Text(source.name),
                      subtitle: Text('${source.host}:${source.port}'),
                      trailing: ListenableBuilder(
                        listenable: vm.remove,
                        builder: (context, _) => IconButton(
                          tooltip: 'Удалить',
                          icon: const Icon(Icons.delete_outline),
                          onPressed: vm.remove.running
                              ? null
                              : () => vm.remove.execute(source.id),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onRemoveResult() {
    if (widget.viewModel.removeFailed) {
      widget.viewModel.remove.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось удалить')),
      );
    }
  }
}
