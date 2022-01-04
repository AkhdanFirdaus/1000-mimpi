import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seribu_mimpi/core/injection_container.dart';
import 'package:seribu_mimpi/features/auth/index.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    useEffect(() {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        user.maybeMap(
          user: (user) => getIt<AppRouter>().replaceNamed(''),
          userGuest: (userGuest) => getIt<AppRouter>().replaceNamed(''),
          orElse: () => getIt<AppRouter>().replaceNamed('auth'),
        );
      });
      return null;
    }, []);
    return const Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.pink,
          size: 100,
        ),
      ),
    );
  }
}
