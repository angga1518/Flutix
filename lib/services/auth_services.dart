part of "services.dart";

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Pengguna pengguna = userCredential.user.convertToPengguna(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
      await PenggunaServices.updateUser(pengguna);
      return SignInSignUpResult(pengguna, null);
    } catch (e) {
      return SignInSignUpResult(null, e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Pengguna pengguna = await userCredential.user.fromFirebase();
      return SignInSignUpResult(pengguna, null);
    } catch (e) {
      return SignInSignUpResult(null, e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  Pengguna _pengguna;
  String _message;
  SignInSignUpResult(Pengguna pengguna, String message) {
    _pengguna = pengguna;
    _message = message;
  }

  Pengguna get pengguna => _pengguna;
  String get message => _message.split("]")[1].substring(1);
}
