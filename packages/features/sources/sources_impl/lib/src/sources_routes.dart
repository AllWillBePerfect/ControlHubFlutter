import 'package:core/ui/view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sources_api/sources_api.dart';

import 'add/add_source_viewmodel.dart';
import 'add/widgets/add_source_screen.dart';
import 'data/agent_discovery_service.dart';
import 'list/sources_viewmodel.dart';
import 'list/widgets/sources_screen.dart';

SourcesRepository _repository(BuildContext context) =>
    ProviderScope.containerOf(context, listen: false).read(sourcesRepositoryProvider);

final List<RouteBase> sourcesRoutes = [
  GoRoute(
  path: SourcesPaths.list,
  builder: (context, state) => ViewModelScope(
    create: () => SourcesViewModel(sourcesRepository: _repository(context)),
    builder: (context, vm) => SourcesScreen(viewModel: vm),
  ),
),
GoRoute(
  path: SourcesPaths.add,
  builder: (context, state) => ViewModelScope(
    create: () => AddSourceViewModel(
      sourcesRepository: _repository(context),
      discovery: AgentDiscoveryService(),
    ),
    builder: (context, vm) => AddSourceScreen(viewModel: vm),
  ),
),
];
