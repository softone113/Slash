import 'package:flutter/material.dart';
import 'package:slashtribe1/routes/route_name.dart';
import '../presentations/auth/sign_in/login.dart';
import '../presentations/auth/sign_up/sign_up.dart';
import '../presentations/forget/forget_password.dart';
import '../presentations/hobby_screen/hobby_detail_screen.dart';
import '../presentations/hobby_screen/hobby_screen.dart';
import '../presentations/home_screen/homepage.dart';
import '../presentations/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteName.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RouteName.forget:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case RouteName.homepage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteName.hobby:
        return MaterialPageRoute(builder: (_) => HobbyScreen());
      case RouteName.hobbyDetail:
        if (args is Map<String, String>) {
          return MaterialPageRoute(
            builder: (_) => HobbyDetail(
              imageUrl: args['imageUrl']!,
              title: args['title']!,
              price: args['price']!,
              description: args['description']!,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("Error: Route not found"),
        ),
      ),
    );
  }
}
