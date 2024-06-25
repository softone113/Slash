import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slashtribe1/routes/appRoute.dart';
import 'package:slashtribe1/routes/route_name.dart';
import 'package:slashtribe1/utils/app_contants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
