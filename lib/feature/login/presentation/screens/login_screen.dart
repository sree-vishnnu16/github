import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/feature/login/presentation/bloc/login_bloc.dart';
import 'package:github/feature/login/presentation/bloc/login_event.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 50,
          child: SignInButton(
            Buttons.gitHub,
            onPressed: () {
              context.read<LoginBloc>().add(GithubLoginRequested());
            },
          ),
        ),
      ),
    );
  }
}
