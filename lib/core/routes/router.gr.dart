// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    AuthWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AuthWrapperPage());
    },
    HomeWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeWrapperPage());
    },
    EventWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    CreatorWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    SpeakerWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ErrorRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ErrorPage());
    },
    SelectUserRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SelectUserPage());
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    HomeEventRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeEventPage());
    },
    HomeScheduleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeSchedulePage());
    },
    HomeProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeProfilePage());
    },
    EventRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EventPage());
    },
    EventCreateRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EventCreatePage());
    },
    EventUpdateRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventUpdateRouteArgs>(
          orElse: () => EventUpdateRouteArgs(id: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: EventUpdatePage(key: args.key, id: args.id));
    },
    EventManageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EventManagePage());
    },
    EventListRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EventListRouteArgs>(
          orElse: () => EventListRouteArgs(
              title: queryParams.getString('title', "Event")));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: EventListPage(key: args.key, title: args.title));
    },
    EventDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailRouteArgs>(
          orElse: () => EventDetailRouteArgs(id: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: EventDetailPage(key: args.key, id: args.id));
    },
    CreatorRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CreatorPage());
    },
    CreatorDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CreatorDetailRouteArgs>(
          orElse: () => CreatorDetailRouteArgs(id: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CreatorDetailPage(key: args.key, id: args.id));
    },
    SpeakerRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SpeakerPage());
    },
    SpeakerDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SpeakerDetailRouteArgs>(
          orElse: () => SpeakerDetailRouteArgs(id: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SpeakerDetailPage(key: args.key, id: args.id));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: 'splash'),
        RouteConfig(AuthWrapperRoute.name, path: 'auth', children: [
          RouteConfig(SelectUserRoute.name,
              path: '', parent: AuthWrapperRoute.name),
          RouteConfig(LoginRoute.name,
              path: 'login', parent: AuthWrapperRoute.name),
          RouteConfig(RegisterRoute.name,
              path: 'register', parent: AuthWrapperRoute.name)
        ]),
        RouteConfig(HomeWrapperRoute.name, path: '', children: [
          RouteConfig(HomeRoute.name, path: '', parent: HomeWrapperRoute.name),
          RouteConfig(HomeEventRoute.name,
              path: 'home-event', parent: HomeWrapperRoute.name),
          RouteConfig(HomeScheduleRoute.name,
              path: 'home-schedule', parent: HomeWrapperRoute.name),
          RouteConfig(HomeProfileRoute.name,
              path: 'home-profile', parent: HomeWrapperRoute.name)
        ]),
        RouteConfig(EventWrapperRoute.name, path: 'event', children: [
          RouteConfig(EventRoute.name,
              path: '', parent: EventWrapperRoute.name),
          RouteConfig(EventCreateRoute.name,
              path: 'create', parent: EventWrapperRoute.name),
          RouteConfig(EventUpdateRoute.name,
              path: ':id/update', parent: EventWrapperRoute.name),
          RouteConfig(EventManageRoute.name,
              path: 'manage', parent: EventWrapperRoute.name),
          RouteConfig(EventListRoute.name,
              path: 'list', parent: EventWrapperRoute.name),
          RouteConfig(EventDetailRoute.name,
              path: ':id', parent: EventWrapperRoute.name)
        ]),
        RouteConfig(CreatorWrapperRoute.name, path: 'creator', children: [
          RouteConfig(CreatorRoute.name,
              path: '', parent: CreatorWrapperRoute.name),
          RouteConfig(CreatorDetailRoute.name,
              path: ':id', parent: CreatorWrapperRoute.name)
        ]),
        RouteConfig(SpeakerWrapperRoute.name, path: 'speaker', children: [
          RouteConfig(SpeakerRoute.name,
              path: '', parent: SpeakerWrapperRoute.name),
          RouteConfig(SpeakerDetailRoute.name,
              path: ':id', parent: SpeakerWrapperRoute.name)
        ]),
        RouteConfig(ErrorRoute.name, path: 'error'),
        RouteConfig('*#redirect',
            path: '*', redirectTo: 'error', fullMatch: true)
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: 'splash');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [AuthWrapperPage]
class AuthWrapperRoute extends PageRouteInfo<void> {
  const AuthWrapperRoute({List<PageRouteInfo>? children})
      : super(AuthWrapperRoute.name, path: 'auth', initialChildren: children);

  static const String name = 'AuthWrapperRoute';
}

/// generated route for
/// [HomeWrapperPage]
class HomeWrapperRoute extends PageRouteInfo<void> {
  const HomeWrapperRoute({List<PageRouteInfo>? children})
      : super(HomeWrapperRoute.name, path: '', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [EmptyRouterPage]
class EventWrapperRoute extends PageRouteInfo<void> {
  const EventWrapperRoute({List<PageRouteInfo>? children})
      : super(EventWrapperRoute.name, path: 'event', initialChildren: children);

  static const String name = 'EventWrapperRoute';
}

/// generated route for
/// [EmptyRouterPage]
class CreatorWrapperRoute extends PageRouteInfo<void> {
  const CreatorWrapperRoute({List<PageRouteInfo>? children})
      : super(CreatorWrapperRoute.name,
            path: 'creator', initialChildren: children);

  static const String name = 'CreatorWrapperRoute';
}

/// generated route for
/// [EmptyRouterPage]
class SpeakerWrapperRoute extends PageRouteInfo<void> {
  const SpeakerWrapperRoute({List<PageRouteInfo>? children})
      : super(SpeakerWrapperRoute.name,
            path: 'speaker', initialChildren: children);

  static const String name = 'SpeakerWrapperRoute';
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<void> {
  const ErrorRoute() : super(ErrorRoute.name, path: 'error');

  static const String name = 'ErrorRoute';
}

/// generated route for
/// [SelectUserPage]
class SelectUserRoute extends PageRouteInfo<void> {
  const SelectUserRoute() : super(SelectUserRoute.name, path: '');

  static const String name = 'SelectUserRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [HomeEventPage]
class HomeEventRoute extends PageRouteInfo<void> {
  const HomeEventRoute() : super(HomeEventRoute.name, path: 'home-event');

  static const String name = 'HomeEventRoute';
}

/// generated route for
/// [HomeSchedulePage]
class HomeScheduleRoute extends PageRouteInfo<void> {
  const HomeScheduleRoute()
      : super(HomeScheduleRoute.name, path: 'home-schedule');

  static const String name = 'HomeScheduleRoute';
}

/// generated route for
/// [HomeProfilePage]
class HomeProfileRoute extends PageRouteInfo<void> {
  const HomeProfileRoute() : super(HomeProfileRoute.name, path: 'home-profile');

  static const String name = 'HomeProfileRoute';
}

/// generated route for
/// [EventPage]
class EventRoute extends PageRouteInfo<void> {
  const EventRoute() : super(EventRoute.name, path: '');

  static const String name = 'EventRoute';
}

/// generated route for
/// [EventCreatePage]
class EventCreateRoute extends PageRouteInfo<void> {
  const EventCreateRoute() : super(EventCreateRoute.name, path: 'create');

  static const String name = 'EventCreateRoute';
}

/// generated route for
/// [EventUpdatePage]
class EventUpdateRoute extends PageRouteInfo<EventUpdateRouteArgs> {
  EventUpdateRoute({Key? key, required int id})
      : super(EventUpdateRoute.name,
            path: ':id/update',
            args: EventUpdateRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'EventUpdateRoute';
}

class EventUpdateRouteArgs {
  const EventUpdateRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'EventUpdateRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [EventManagePage]
class EventManageRoute extends PageRouteInfo<void> {
  const EventManageRoute() : super(EventManageRoute.name, path: 'manage');

  static const String name = 'EventManageRoute';
}

/// generated route for
/// [EventListPage]
class EventListRoute extends PageRouteInfo<EventListRouteArgs> {
  EventListRoute({Key? key, String title = "Event"})
      : super(EventListRoute.name,
            path: 'list',
            args: EventListRouteArgs(key: key, title: title),
            rawQueryParams: {'title': title});

  static const String name = 'EventListRoute';
}

class EventListRouteArgs {
  const EventListRouteArgs({this.key, this.title = "Event"});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'EventListRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [EventDetailPage]
class EventDetailRoute extends PageRouteInfo<EventDetailRouteArgs> {
  EventDetailRoute({Key? key, required int id})
      : super(EventDetailRoute.name,
            path: ':id',
            args: EventDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'EventDetailRoute';
}

class EventDetailRouteArgs {
  const EventDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'EventDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CreatorPage]
class CreatorRoute extends PageRouteInfo<void> {
  const CreatorRoute() : super(CreatorRoute.name, path: '');

  static const String name = 'CreatorRoute';
}

/// generated route for
/// [CreatorDetailPage]
class CreatorDetailRoute extends PageRouteInfo<CreatorDetailRouteArgs> {
  CreatorDetailRoute({Key? key, required int id})
      : super(CreatorDetailRoute.name,
            path: ':id',
            args: CreatorDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'CreatorDetailRoute';
}

class CreatorDetailRouteArgs {
  const CreatorDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CreatorDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [SpeakerPage]
class SpeakerRoute extends PageRouteInfo<void> {
  const SpeakerRoute() : super(SpeakerRoute.name, path: '');

  static const String name = 'SpeakerRoute';
}

/// generated route for
/// [SpeakerDetailPage]
class SpeakerDetailRoute extends PageRouteInfo<SpeakerDetailRouteArgs> {
  SpeakerDetailRoute({Key? key, required int id})
      : super(SpeakerDetailRoute.name,
            path: ':id',
            args: SpeakerDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'SpeakerDetailRoute';
}

class SpeakerDetailRouteArgs {
  const SpeakerDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'SpeakerDetailRouteArgs{key: $key, id: $id}';
  }
}
