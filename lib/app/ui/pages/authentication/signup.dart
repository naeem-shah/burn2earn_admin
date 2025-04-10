import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/authentication_controller.dart';
import '../../../route/name_routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final controller = Get.put(AuthenticationController());

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          // logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create an account",
                style: textTheme.titleLarge?.copyWith(color: Colors.white),
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
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Can't be empty";
                      }
                      if (!text.isEmail){

                        return "Invalid email";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [
                      AutofillHints.email,
                    ],
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
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Confirm Password",
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
                    textInputAction: TextInputAction.done,
                  ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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

                        bool isCreated = await controller.handleRegistration(
                          emailController.text,
                          passwordController.text,
                          context
                        );

                        if (isCreated) {
                          controller.accountCreatedDialog(context);
                        }
                      },
                child: const Text("Create an account"),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          GestureDetector(
            onTap: () {
              context.pushReplacement(loginRoute);
            },
            child: Text(
              "Already have an account? Login here",
              style: textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
