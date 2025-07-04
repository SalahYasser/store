import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Dio dio = Dio();

  Future<void> login({required String name, required String password}) async {
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": name, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final accessToken = data['accessToken'];

        final pref = await SharedPreferences.getInstance();

        await pref.setString('accessToken', accessToken);

        print('Saved token: $accessToken');
        print('Login successful. Access token saved.');
      } else {
        print('Login failed with status: ${response.statusCode}');
      }

    } on Exception catch (e) {
      print('login error: $e');
    }
  }
}
