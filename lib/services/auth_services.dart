part of "services.dart";

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
        try {
          UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
          Pengguna pengguna = userCredential.user.convertToPengguna(name: name, selectedGenres: selectedGenres, selectedLanguage: selectedLanguage);
          await PenggunaServices.updateUser(pengguna);
          return SignInSignUpResult(pengguna: pengguna);
        } catch (e) {
          return SignInSignUpResult(message: e.toString());
        }
      }
}

class SignInSignUpResult {
  final Pengguna pengguna;
  final String message;
  SignInSignUpResult({this.pengguna, this.message});  
}
