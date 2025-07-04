import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.dio) : super(LoginInitial());

  final Dio dio;

  Future<void> login({required String name, required String password}) async {

    emit(LoginLoading());

    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": name, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {

        emit(LoginSuccess());

        final data = response.data;

        final accessToken = data['accessToken'];

        final pref = await SharedPreferences.getInstance();

        await pref.setString('accessToken', accessToken);

      } else {

        emit(
          LoginFailure(
            errMessage: 'Login failed with status: ${response.statusCode}',
          ),
        );

      }
    } catch (e) {
      emit(
        LoginFailure(
          errMessage: 'Login failed with error: ${e.toString()}',
        ),
      );
    }
  }
}
