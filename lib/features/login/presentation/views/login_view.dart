import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/login/presentation/views/widgets/login_view_body.dart';

import '../../../home/presentation/views/home_view.dart';
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
          listener: (context, state) {

            if (state is LoginSuccess) {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );

              // ScaffoldMessenger.of(
              //   context,
              // ).showSnackBar(SnackBar(content: Text('Login successful')));

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