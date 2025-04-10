import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/authentication_controller.dart';
import '../../../route/name_routes.dart';
import '../../widgets/logo_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final controller = Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            // logo
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWidget(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            // form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Username",
                        prefixIcon: const Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.password),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.push(forgetPasswordRoute);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    fixedSize: const Size(double.infinity, 47),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    foregroundColor: Colors.white,
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          Get.focusScope?.unfocus();
                          await controller.handleLogin(emailController.text,
                              passwordController.text, context);
                        },
                  child: const Text("Sign in"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "OR",
                style: textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Sign-in using?",
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
