import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/feature/login/application/use_cases/login_use_cases.dart';
import 'package:github/feature/login/presentation/bloc/login_event.dart';
import 'package:github/feature/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInWithGithubUseCase githubLoginUseCase;

  LoginBloc(this.githubLoginUseCase) : super(LoginInitial()) {
    on<GithubLoginRequested>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await githubLoginUseCase.signIn();
        emit(LoginSuccess(user));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LogoutRequest>((event, emit) async {
      emit(LogoutLoading());
      try {
        // Perform logout logic here
        final success = await githubLoginUseCase.signOut();
        emit(LogoutSuccess(success));
      } catch (e) {
        emit(LogoutFailure(e.toString()));
      }
    });
  }
}
