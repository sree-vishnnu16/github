import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/feature/login/presentation/bloc/login_bloc.dart';
import 'package:github/feature/login/presentation/bloc/login_event.dart';
import 'package:github/feature/login/presentation/bloc/login_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogoutLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is LogoutSuccess) {
          Navigator.of(context).pop(); // Close the loading dialog
          if (state.status) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        }

        if (state is LogoutFailure) {
          Navigator.of(context).pop(); // Close the loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Text('Home Content Here'),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Logout'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                              context.read<LoginBloc>().add(LogoutRequest());
                            },
                            child: Text('Logout'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.logout),
                  label: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
