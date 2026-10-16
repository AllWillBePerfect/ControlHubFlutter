import 'package:control_hub/app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hub_impl/hub_impl.dart';
import 'package:sources_impl/sources_impl.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  routes: [
    ...hubRoutes,
    ...sourcesRoutes,

  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  return null;
}
