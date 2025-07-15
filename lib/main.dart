import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/core/routes/routes.dart';
import 'package:github/core/use_cases_injection/github_usecases_injection.dart';
import 'package:github/feature/login/presentation/bloc/login_bloc.dart';
import 'package:github/firebase_options.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Use cases injection
  GithubUseCasesInjection().init();
  runApp(const GithubApp());
}

class GithubApp extends StatelessWidget {
  const GithubApp({super.key});

  @override
  Widget build(BuildContext context) {
    GithubUseCasesInjection useCasesInjection = GithubUseCasesInjection();
    return MultiProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) =>
                LoginBloc(useCasesInjection.signInWithGithubUseCase),
          )
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.controller,
          initialRoute: Routes.splash,
          title: 'Github',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
