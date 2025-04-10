import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.fontSize, this.color});

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Burn2Earn",
    );
  }
}
