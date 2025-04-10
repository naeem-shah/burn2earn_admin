import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../route/name_routes.dart';
import 'google_analytics.dart';


class AuthenticationController extends GetxController with StateMixin {
  RxBool isLoading = RxBool(false);

  Future handleLogin(String email, String password, BuildContext context) async {
    isLoading.value = true;

    showLoader(context);
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      dismissLoader(context);

      if (userCredential.user != null) {
        navigateToHome(context);
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      dismissLoader(context);

      print("Error: ${e.code}");
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(
          msg: "No user found for that email.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        change(null, status: RxStatus.error("No user found for that email."));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Fluttertoast.showToast(
          msg: "Wrong password provided for that user.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        change(null,
            status: RxStatus.error("Wrong password provided for that user."));
      } else if (e.code == 'invalid-credential') {
        print('Invalid credentials.');
        Fluttertoast.showToast(
          msg: "Invalid credentials.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        change(null,
            status: RxStatus.error("Wrong password provided for that user."));
      } else {
        change(null, status: RxStatus.error(e.message));
      }
      print("${e.code}");
    }
    isLoading.value = false;
  }

  Future<bool> handleRegistration(String email, String password, BuildContext context) async {
    isLoading.value = true;

    showLoader(context);

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      isLoading.value = false;
      dismissLoader(context);
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: "The password provided is too weak.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        change(null,
            status: RxStatus.error("The password provided is too weak."));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: "The account already exists for that email.",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        change(null,
            status:
            RxStatus.error("The account already exists for that email."));
        print('The account already exists for that email.');
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      print(e);
    }

    isLoading.value = false;

    return false;
  }

  // Future handleSocialSignIn(BuildContext context, SocialSignInEnums signInType) async {
  //   isLoading.value = true;
  //
  //   try {
  //     UserCredential? userCredential;
  //     if (signInType == SocialSignInEnums.gmail) {
  //       // userCredential = await _signInWithGoogle();
  //     } else if (signInType == SocialSignInEnums.facebook) {
  //       // userCredential = await _signInWithFacebook();
  //     } else if (signInType == SocialSignInEnums.apple) {}
  //
  //     if (userCredential?.user != null) {
  //       isLoading.value = false;
  //       change(null, status: RxStatus.success());
  //       navigateToHome(context);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Fluttertoast.showToast(
  //       msg: e.message ?? "Something went wrong. Try again later.",
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //     );
  //     change(null, status: RxStatus.error(e.message));
  //     print(e.message);
  //   } catch (e) {
  //     print(e);
  //   }
  //   isLoading.value = false;
  // }

  Future<bool> handleForgetPassword(String email) async {
    isLoading.value = true;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      change(null, status: RxStatus.success());
      isLoading.value = false;

      Fluttertoast.showToast(
        msg: "Reset password email has been sent to $email.",
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong. Try again later.";
      if (e.code == 'auth/invalid-email') {
        message = "Invalid email address";
      } else if (e.code == 'auth/user-not-found') {
        message = "User not found against provided email";
      }

      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      change(null, status: RxStatus.error(e.message));
      print(e.message);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    return false;
  }

  // Future<UserCredential?> _signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   if (loginResult.status == LoginStatus.success) {
  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //     FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
  //
  //     // Once signed in, return the UserCredential
  //     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   }
  //   return null;
  // }
  //
  // Future<UserCredential?> _signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   if (googleUser == null) {
  //     return null;
  //   }
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //   await googleUser.authentication;
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  Future navigateToHome(BuildContext context) async {
    context.pushReplacement(homeRoute);
  }

  void showLoader(BuildContext context) => showAdaptiveDialog(
    context: context,
    builder: (dialogContext){
      return AlertDialog.adaptive(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 24,
            ),
            Text("Loading..."),
          ],
        ),
        contentPadding: EdgeInsets.all(24),
      );
    }
  );

  void dismissLoader(BuildContext context) => context.pop();

  void accountCreatedDialog(BuildContext context) => Get.dialog(
    AlertDialog.adaptive(
      title: const Text("Congratulations"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your account has been created."),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                textStyle: Get.textTheme.titleMedium,
              ),
              onPressed: () {
                context.pushReplacement(loginRoute);
              },
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );

}

enum SocialSignInEnums {
  gmail,
  facebook,
  apple;
}
