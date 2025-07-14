import 'package:flutter/material.dart';
import 'package:github/core/routes/routes.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const LaunchScreen());
}

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.controller,
      initialRoute: Routes.splash,
      title: 'Github',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
