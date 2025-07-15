import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/core/routes/routes.dart';
import 'package:github/feature/login/presentation/bloc/login_bloc.dart';
import 'package:github/feature/login/presentation/bloc/login_event.dart';
import 'package:github/feature/login/presentation/bloc/login_state.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            // Show loading indicator or dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is LoginSuccess) {
            Navigator.of(context).pop(); // Close the loading dialog
            // Navigate to the next screen or show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful!')),
            );
            Navigator.pushReplacementNamed(context, Routes.home);
          } else if (state is LoginFailure) {
            Navigator.of(context).pop(); // Close the loading dialog
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Center(
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
      ),
    );
  }
}
