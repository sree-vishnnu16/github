import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteService {
  Future<UserCredential?> signInWithGithub() async {
    try {
      GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      UserCredential credential = await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
      return credential;
    } catch (e) {
      // You can log this error or handle it as needed
      print('Error signing in with GitHub: $e');
      throw e;
    }
  }
}

