import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:seribu_mimpi/features/auth/index.dart';

import '../../../core/injection_container.dart';

class AuthWrapperPage extends HookConsumerWidget {
  const AuthWrapperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AutoRouter.of(context);
    ref.listen<UserState>(userProvider, (prev, next) {
      next.map(
        userGuest: (userGuest) {
          context.router.root.replace(const HomeWrapperRoute());
        },
        user: (user) {
          MotionToast.success(
            title: "Sukses Login",
            description: "Halo ${user.name}",
            toastDuration: const Duration(seconds: 2),
          ).show(context);
          Future.delayed(const Duration(seconds: 2), () {
            ref.read(userProvider.notifier).loadUser(user);
            context.router.root.replace(const HomeWrapperRoute());
          });
        },
        error: (error) {
          MotionToast.error(
            title: "Gagal Login",
            description: error.message,
            toastDuration: const Duration(seconds: 2),
          ).show(context);
        },
        unauthenticated: (_) {},
      );
    });
    return const AutoRouter();
  }
}
