import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/authentication_controller.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter your registered Email ID to reset your password. We will send resent password link to your Email ID.",
                  style: Get.textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Email",
                          filled: true,
                          fillColor: const Color(0xFFF8F8F8),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required field";
                          }
                          if (!value.isEmail) {
                            return "Enter valid email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: Get.width,
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              Get.focusScope?.unfocus();
                              bool results =
                                  await controller.handleForgetPassword(
                                emailController.text,
                              );

                              if (results) {
                                emailController.clear();
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: Get.textTheme.titleMedium,
                      ),
                      child: const Text('Send'),
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
