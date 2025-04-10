import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_strings.dart';
import '../../route/name_routes.dart';
import '../widgets/logo_widget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppStrings.splashBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: Column(
                  children: [
                    const LogoWidget(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                    Text(
                      "Spark to ignite",
                      style: textTheme.headlineMedium?.copyWith(
                          color: const Color(0xffF8CA56),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
      }
    });
  }
}
