import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // Future<bool> signOut() async {
  //   try {
  //      await FirebaseAuth.instance.signOut();
  //      return true;
  //   } on FirebaseAuthException catch (e) {
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      // Optional: Attempt to log out from GitHub in browser
      // This won't revoke tokens but will clear session cookies
      await launchUrl(
        Uri.parse("https://github.com/logout"),
        mode: LaunchMode.externalApplication,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException on logout: ${e.code}');
      rethrow;
    } catch (e) {
      print('Unknown error during logout: $e');
      rethrow;
    }
  }
}
