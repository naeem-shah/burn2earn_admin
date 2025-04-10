import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_strings.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../route/name_routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.sizeOf(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppStrings.homeBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.3),
                  border: Border.all(color: Colors.deepOrange),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      "Games",
                      style: textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        foregroundColor: Colors.white,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      onPressed: () {
                      },
                      child: const Text("View Page"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.3),
                  border: Border.all(color: Colors.indigo),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Text(
                      "Nutrition",
                      style: textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        foregroundColor: Colors.white,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Coming soon!", backgroundColor: Colors.red);
                      },
                      child: const Text("View Page"),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
