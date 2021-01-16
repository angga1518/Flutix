part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  Pengguna pengguna;

  UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  UserLoaded(Pengguna pengguna){
    super.pengguna = pengguna;
  }
}

class UpdatedUserLoaded extends UserState {
  UpdatedUserLoaded(Pengguna pengguna){
    super.pengguna = pengguna;
  }
}
