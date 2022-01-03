import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/index.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'splash',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: 'auth',
      name: 'AuthWrapperRoute',
      page: EmptyRouterPage,
    ),
    AutoRoute(
      path: '',
      name: 'HomeWrapperRoute',
      page: HomePage,
    ),
    AutoRoute(
      path: 'error',
      page: ErrorPage,
    ),
    RedirectRoute(path: '*', redirectTo: 'error')
  ],
)
class AppRouter extends _$AppRouter {}
