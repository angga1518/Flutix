part of 'models.dart';

class Pengguna extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePictureUrl;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  Pengguna(this.id, this.email,
      {this.name,
      this.profilePictureUrl,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  Pengguna copyWith({String name, String profilePictureUrl, int balance}) =>
      Pengguna(this.id, this.email,
          name: name ?? this.name,
          profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePictureUrl,
        selectedGenres,
        selectedLanguage,
        balance
      ];

  @override
  String toString() {
    return "[$id] - $name, $email";
  }
}
