import 'package:flutter/material.dart';

class ForgotYourPassword extends StatelessWidget {
  const ForgotYourPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {}, // Added onPressed for tap functionality
        child: const Text('Forgot Your Password?'),
      ),
    );
  }
}