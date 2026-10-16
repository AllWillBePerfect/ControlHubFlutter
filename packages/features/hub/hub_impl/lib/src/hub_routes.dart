import 'package:core/ui/view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hub_api/hub_api.dart';
import 'package:sources_api/sources_api.dart';

import 'data/capabilities_repository_remote.dart';
import 'hub_viewmodel.dart';
import 'widgets/hub_screen.dart';

SourcesRepository _sources(BuildContext context) =>
    ProviderScope.containerOf(context, listen: false).read(sourcesRepositoryProvider);

final List<RouteBase> hubRoutes = [
  GoRoute(
  path: HubPaths.home,
  builder: (context, state) => ViewModelScope(
    create: () {
      final sources = _sources(context);
      return HubViewModel(
        sourcesRepository: sources,
        capabilitiesRepository: CapabilitiesRepositoryRemote(sourcesRepository: sources),
      );
    },
    builder: (context, vm) => HubScreen(viewModel: vm),
  ),
),
];
