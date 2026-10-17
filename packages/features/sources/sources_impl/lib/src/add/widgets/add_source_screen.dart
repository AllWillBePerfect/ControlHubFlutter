import 'package:core/network/agent_protocol.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/agent_discovery_service.dart';
import '../add_source_state.dart';
import '../add_source_viewmodel.dart';

class AddSourceScreen extends StatefulWidget {
  const AddSourceScreen({super.key, required this.viewModel});

  final AddSourceViewModel viewModel;

  @override
  State<AddSourceScreen> createState() => _AddSourceScreenState();
}

class _AddSourceScreenState extends State<AddSourceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _host = TextEditingController();
  final _port = TextEditingController(text: '${AgentProtocol.httpPort}');
  final _token = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.save.addListener(_onSaveResult);
    widget.viewModel.discover.addListener(_onDiscoverResult);
  }

  @override
  void didUpdateWidget(covariant AddSourceScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.save.removeListener(_onSaveResult);
      oldWidget.viewModel.discover.removeListener(_onDiscoverResult);
      widget.viewModel.save.addListener(_onSaveResult);
      widget.viewModel.discover.addListener(_onDiscoverResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.save.removeListener(_onSaveResult);
    widget.viewModel.discover.removeListener(_onDiscoverResult);
    _name.dispose();
    _host.dispose();
    _port.dispose();
    _token.dispose();
    super.dispose();
  }

  void _pick(DiscoveredAgent agent) {
    _name.text = agent.name;
    _host.text = agent.host;
    _port.text = '${agent.port}';
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.viewModel.save.execute((
      name: _name.text,
      host: _host.text,
      port: _port.text,
      token: _token.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Scaffold(
      appBar: AppBar(title: const Text('Новый источник')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListenableBuilder(
              listenable: vm.discover,
              builder: (context, _) => OutlinedButton.icon(
                onPressed: vm.discover.running ? null : vm.discover.execute,
                icon: vm.discover.running
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.wifi_find),
                label: Text(vm.discover.running ? 'Поиск...' : 'Найти в сети'),
              ),
            ),
            ValueListenableBuilder<AddSourceState>(
              valueListenable: vm.state,
              builder: (context, state, _) => Column(
                children: [
                  if (state.nothingFound)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Ничего не найдено, введите адрес вручную'),
                    ),
                  for (final agent in state.found)
                    ListTile(
                      leading: const Icon(Icons.computer),
                      title: Text(agent.name),
                      subtitle: Text('${agent.host}:${agent.port}'),
                      onTap: () => _pick(agent),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: 'Имя',
                hintText: 'ПК',
                border: OutlineInputBorder(),
              ),
              validator: vm.validateName,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _host,
              decoration: const InputDecoration(
                labelText: 'Адрес',
                hintText: '192.168.2.222',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
              validator: vm.validateHost,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _port,
              decoration: const InputDecoration(
                labelText: 'Порт',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: vm.validatePort,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _token,
              decoration: const InputDecoration(
                labelText: 'Токен',
                helperText: 'Токен из agent.properties',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: vm.validateToken,
            ),
            const SizedBox(height: 24),
            ListenableBuilder(
              listenable: vm.save,
              builder: (context, _) => FilledButton(
                onPressed: vm.save.running ? null : _submit,
                child: Text(vm.save.running ? 'Сохранение...' : 'Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSaveResult() {
    final vm = widget.viewModel;
    if (vm.saved) {
      vm.save.clearResult();
      context.pop(true);
    } else if (vm.saveFailed) {
      vm.save.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось сохранить')),
      );
    }
  }

  void _onDiscoverResult() {
    final vm = widget.viewModel;
    if (vm.discoverFailed) {
      vm.discover.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Поиск не удался')),
      );
    }
  }
}
