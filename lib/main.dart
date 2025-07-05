import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/route/on_generate_route.dart';
import 'core/route/routes.dart';
import 'features/home/presentation/views/home_view.dart';
import 'features/login/presentation/views/login_view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(StoreApp(isLoggedIn: isLoggedIn));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: onGenerateRoute,
      initialRoute: isLoggedIn ? Routes.homeView : Routes.loginView,
      home: isLoggedIn ? const HomeView() : const LoginView(),
    );
  }
}

