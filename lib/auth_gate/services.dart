import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Sign in with Google
  signInWithGoogle() async {
    // start interaction
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // get details from req
    final GoogleSignInAuthentication gAuth = await googleUser!.authentication;

    // create user credentials
    final credential = GoogleAuthProvider.credential(
      idToken: gAuth.idToken,
      accessToken: gAuth.accessToken,
    );

    // use credential to sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
