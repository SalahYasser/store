import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/features/login/presentation/views/widgets/login_view_body.dart';
import '../../../../core/route/routes.dart';
import '../cubits/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => LoginCubit(Dio()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginSuccess) {

              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', true);

              Navigator.pushReplacementNamed(context, Routes.homeView);

            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errMessage)));

            }
          },
          builder: (context, state) {
            return Scaffold(body: LoginViewBody());
          },
        ),
      ),
    );
  }
}
//        emilys
//        emilyspass