import 'package:flutter/material.dart';
import 'package:github/feature/github/presentation/screens/repo_detail_screen.dart';
import 'package:github/feature/home/home_screen.dart';
import 'package:github/feature/login/presentation/screens/login_screen.dart';
import 'package:github/feature/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String repoDetail = '/repoDetail';

//Route controller
  static Route<dynamic> controller(RouteSettings settings) {
    final name = settings.name;
    final Object? arguments = settings.arguments;
    switch (name) {
      case splash:
        return _buildMaterialRoute(settings, const SplashScreen());
      case login:
        return _buildMaterialRoute(settings, LoginScreen());
      case home:
        return _buildMaterialRoute(settings, HomeScreen());
      case repoDetail:
        final args = _castArgs<RepoDetailScreen>(arguments);
        return _buildMaterialRoute(
            settings, RepoDetailScreen(owner: args.owner, repo: args.repo));
      default:
        throw Exception('Route not found');
    }
  }

  static MaterialPageRoute _buildMaterialRoute(
      RouteSettings settings, Widget widget) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }

  static T _castArgs<T>(Object? args) {
    if (args is T) {
      return args;
    }
    throw Exception('Arguments not of type $T');
  }
}
