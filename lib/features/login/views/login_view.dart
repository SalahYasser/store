import 'package:flutter/material.dart';
import 'package:store_app/features/login/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const LoginViewBody(),
    );
  }
}
