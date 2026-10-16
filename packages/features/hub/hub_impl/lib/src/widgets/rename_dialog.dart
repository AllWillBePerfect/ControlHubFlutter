import 'package:flutter/material.dart';

Future<String?> showRenameDialog(BuildContext context, String current) =>
    showDialog<String>(
      context: context,
      builder: (_) => _RenameDialog(current: current),
    );

class _RenameDialog extends StatefulWidget {
  const _RenameDialog({required this.current});

  final String current;

  @override
  State<_RenameDialog> createState() => _RenameDialogState();
}

class _RenameDialogState extends State<_RenameDialog> {
  late final _controller = TextEditingController(text: widget.current);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() => Navigator.pop(context, _controller.text.trim());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Переименовать'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: 40,
        decoration: const InputDecoration(
          helperText: 'Оставьте пустым, чтобы вернуть исходное имя',
        ),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Отмена')),
        FilledButton(onPressed: _submit, child: const Text('Сохранить')),
      ],
    );
  }
}
