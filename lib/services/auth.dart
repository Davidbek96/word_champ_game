import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // TODO
      // _firebaseAuth.currentUser?.updateDisplayName(displayName)
      return userCredential.user;
    } catch (e) {
      // Handle any errors here
      print('Error during sign up: $e');
      throw Exception(e);
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      // Handle any errors here
      print('Error during sign in: $e');
      throw Exception(e);
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // await _firebaseAuth.userChanges();
  }

  // Get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Check if the user is signed in
  bool isUserSignedIn() {
    final User? currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}
