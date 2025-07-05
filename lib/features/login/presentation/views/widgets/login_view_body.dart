import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'forgot_your_password.dart';
import 'or_divider.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import 'dont_have_an_account.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: loginFormKey,
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
              controller: userNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              obscureText: true, // Added for password field
              decoration: InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(CupertinoIcons.eye_slash),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            const ForgotYourPassword(),
            const SizedBox(height: 16),

            context.watch<LoginCubit>().state is LoginLoading
                ? Center(child: const CircularProgressIndicator())
                : CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      final name = userNameController.text;
                      final password = passwordController.text;
                      context.read<LoginCubit>().login(
                        name: name,
                        password: password,
                      );
                    }
                  },
                ),
            const SizedBox(height: 16),
            const OrDivider(),
            const SizedBox(height: 16),
            const DontHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
