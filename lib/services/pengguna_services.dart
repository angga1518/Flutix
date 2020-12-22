part of 'services.dart';

class PenggunaServices {
  static CollectionReference _collectionReference = FirebaseFirestore.instance.collection("pengguna");

  static Future<void> updateUser(Pengguna pengguna) async {
    String genres = "";

    for (var i = 0; i < pengguna.selectedGenres.length; i++) {
      String genre = pengguna.selectedGenres[i];
      genres += genre + ((genre == pengguna.selectedGenres.last) ? "": ",");
    }

    _collectionReference.doc(pengguna.id).set({
      'email':pengguna.email,
      'name':pengguna.name,
      'balance':pengguna.balance,
      'selectedGenres':genres,
      'selectedLanguage':pengguna.selectedLanguage,
      'profilePictureUrl':pengguna.profilePictureUrl ?? ""
    });
  }
}

