part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String id;

  LoadUser(this.id);
}

class SignOut extends UserEvent {}

class UpdateData extends UserEvent {
  final String name;
  final String profileImage;

  UpdateData({this.name, this.profileImage});
}

class TopUp extends UserEvent {
  final int amount;

  TopUp(this.amount);
}

class Purchase extends UserEvent {
  final int amount;

  Purchase(this.amount);
}
