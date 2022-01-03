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
          routeData: routeData, child: const EmptyRouterPage());
    },
    HomeWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ErrorRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ErrorPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        RouteConfig(SplashRoute.name, path: 'splash'),
        RouteConfig(AuthWrapperRoute.name, path: 'auth'),
        RouteConfig(HomeWrapperRoute.name, path: ''),
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
/// [EmptyRouterPage]
class AuthWrapperRoute extends PageRouteInfo<void> {
  const AuthWrapperRoute() : super(AuthWrapperRoute.name, path: 'auth');

  static const String name = 'AuthWrapperRoute';
}

/// generated route for
/// [HomePage]
class HomeWrapperRoute extends PageRouteInfo<void> {
  const HomeWrapperRoute() : super(HomeWrapperRoute.name, path: '');

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<void> {
  const ErrorRoute() : super(ErrorRoute.name, path: 'error');

  static const String name = 'ErrorRoute';
}
