import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seribu_mimpi/core/themes/app_style.dart';
import '../core/injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
      title: '1000 Mimpi',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        inputDecorationTheme: AppStyle.inputTheme,
        elevatedButtonTheme: AppStyle.elevatedButtonTheme,
      ),
    );
  }
}
