import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../ui/pages/authentication/forget_password.dart';
import '../ui/pages/authentication/login.dart';
import '../ui/pages/authentication/signup.dart';
import '../ui/pages/edit_profile.dart';
import '../ui/pages/games.dart';
import '../ui/pages/home.dart';
import '../ui/pages/splash.dart';
import 'name_routes.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    navigatorKey: Get.key,
    initialLocation: defaultRoute,
    routes: [
      GoRoute(
        name: "Default Route",
        path: defaultRoute,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        name: loginRouteName,
        path: loginRoute,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        name: forgetPasswordRouteName,
        path: forgetPasswordRoute,
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(
        name: signupRouteName,
        path: signupRoute,
        builder: (context, state) => const Signup(),
      ),
      GoRoute(
        name: gamesRouteName,
        path: gamesRoute,
        builder: (context, state) => const Games(),
      ),
      GoRoute(
        name: editProfileRouteName,
        path: editProfileRoute,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        name: homeRouteName,
        path: homeRoute,
        builder: (context, state) => const Home(),
      ),
    ],
    errorBuilder: (context, state) =>
        Text(state.error?.message ?? "error in go router"),
  );

  GoRouter get router => _router;
}
