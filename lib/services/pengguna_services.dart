part of 'services.dart';

class PenggunaServices {
  static CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("pengguna");

  static Future<void> updateUser(Pengguna pengguna) async {
    String genres = "";

    for (var i = 0; i < pengguna.selectedGenres.length; i++) {
      String genre = pengguna.selectedGenres[i];
      genres += genre + ((genre == pengguna.selectedGenres.last) ? "" : ",");
    }

    _collectionReference.doc(pengguna.id).set({
      'email': pengguna.email,
      'name': pengguna.name,
      'balance': pengguna.balance,
      'selectedGenres': genres,
      'selectedLanguage': pengguna.selectedLanguage,
      'profilePictureUrl': pengguna.profilePictureUrl ?? ""
    });
  }

  static Future<Pengguna> getUser(String id) async {
    DocumentSnapshot documentSnapshot =
        await _collectionReference.doc(id).get();
    return Pengguna(
      id,
      documentSnapshot.data()['email'],
      balance: documentSnapshot.data()['balance'],
      profilePictureUrl: documentSnapshot.data()['profilePictureUrl'],
      selectedGenres: documentSnapshot.data()['selectedGenres'].toString().split(","),
      selectedLanguage: documentSnapshot.data()['selectedLanguage'],
      name: documentSnapshot.data()['name'],
    );
  }
}
