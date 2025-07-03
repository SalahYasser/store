import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Dio dio = Dio();

  login({required String name, required String password}) async {
    final response = await dio.post(
      'https://dummyjson.com/auth/login',
      data: {"username": name, "password": password},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }
}
