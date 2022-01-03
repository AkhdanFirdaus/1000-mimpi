import 'package:flutter/material.dart';
import 'package:seribu_mimpi/core/injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate.of(context),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
