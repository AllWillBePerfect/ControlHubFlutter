import 'package:flutter/widgets.dart';

abstract interface class ViewModel {
  void dispose();
}

class ViewModelScope<VM extends ViewModel> extends StatefulWidget {
  const ViewModelScope({super.key, required this.create, required this.builder});

  final VM Function() create;
  final Widget Function(BuildContext context, VM viewModel) builder;

  @override
  State<ViewModelScope<VM>> createState() => _ViewModelScopeState<VM>();
}

class _ViewModelScopeState<VM extends ViewModel> extends State<ViewModelScope<VM>> {
  late final VM _viewModel = widget.create();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _viewModel);
}
