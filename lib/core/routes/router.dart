import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/auth/index.dart';
import '../../features/creator/index.dart';
import '../../features/event/index.dart';
import '../../features/home/index.dart';
import '../../features/speaker/index.dart';
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
      page: AuthWrapperPage,
      children: [
        AutoRoute(
          path: '',
          initial: true,
          page: SelectUserPage,
        ),
        AutoRoute(
          path: 'login',
          page: LoginPage,
        ),
        AutoRoute(
          path: 'register',
          page: RegisterPage,
        ),
      ],
    ),
    AutoRoute(
      path: '',
      name: 'HomeWrapperRoute',
      page: HomeWrapperPage,
      children: [
        AutoRoute(
          path: '',
          initial: true,
          page: HomePage,
        ),
        AutoRoute(
          path: 'home-event',
          page: HomeEventPage,
        ),
        AutoRoute(
          path: 'home-schedule',
          page: HomeSchedulePage,
        ),
        AutoRoute(
          path: 'home-profile',
          page: HomeProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: 'event',
      name: 'EventWrapperRoute',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          initial: true,
          page: EventPage,
        ),
        AutoRoute(
          path: 'create',
          page: EventCreatePage,
        ),
        AutoRoute(
          path: ':id/update',
          page: EventUpdatePage,
        ),
        AutoRoute(
          path: 'manage',
          page: EventManagePage,
        ),
        AutoRoute(
          path: 'list',
          page: EventListPage,
        ),
        AutoRoute(
          path: ':id',
          page: EventDetailPage,
        ),
      ],
    ),
    AutoRoute(
      path: 'creator',
      name: 'CreatorWrapperRoute',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          initial: true,
          page: CreatorPage,
        ),
        AutoRoute(
          path: ':id',
          page: CreatorDetailPage,
        ),
      ],
    ),
    AutoRoute(
      path: 'speaker',
      name: 'SpeakerWrapperRoute',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          initial: true,
          page: SpeakerPage,
        ),
        AutoRoute(
          path: ':id',
          page: SpeakerDetailPage,
        ),
      ],
    ),
    AutoRoute(
      path: 'error',
      page: ErrorPage,
    ),
    RedirectRoute(path: '*', redirectTo: 'error')
  ],
)
class AppRouter extends _$AppRouter {}
