import 'package:firebase_auth/firebase_auth.dart';

class LoginRemoteService {
  Future<UserCredential?> signInWithGithub() async {
    try {
      GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      final credential =
          await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
      return credential;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
