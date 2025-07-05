import 'package:flutter/material.dart';
import 'package:store_app/core/route/routes.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/login/presentation/views/login_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case Routes.loginView:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case Routes.homeView:
      return MaterialPageRoute(builder: (context) => const HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
