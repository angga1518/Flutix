part of 'user_bloc.dart';

// ignore: must_be_immutable
abstract class UserState extends Equatable {
  Pengguna pengguna;

  UserState();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class UserInitial extends UserState {}

// ignore: must_be_immutable
class UserLoaded extends UserState {
  UserLoaded(Pengguna pengguna){
    super.pengguna = pengguna;
  }
}

// ignore: must_be_immutable
class UpdatedUserLoaded extends UserState {
  UpdatedUserLoaded(Pengguna pengguna){
    super.pengguna = pengguna;
  }
}
