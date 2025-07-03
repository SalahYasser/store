import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image.asset('assets/images/store.png', height: 100),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true, // Added for password field
            decoration: InputDecoration(
              hintText: 'Enter your password',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(CupertinoIcons.eye),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {}, // Added onPressed for tap functionality
              child: const Text('Forgot Your Password?'),
            ),
          ),
          const SizedBox(height: 16),
          const CustomButton(),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                child: Divider(thickness: 0.5, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Text('Or'),
              ),
              const Expanded(
                child: Divider(thickness: 0.5, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            // Changed from TextSpan to RichText
            text: const TextSpan(
              style: TextStyle(color: Colors.black), // Default text style
              children: [
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}