abstract class LoginEvent {}

class GithubLoginRequested extends LoginEvent {}

class LogoutRequest extends LoginEvent {}
