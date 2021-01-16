import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      Pengguna pengguna = await PenggunaServices.getUser(event.id);
      yield UserLoaded(pengguna);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      Pengguna updatedPengguna = (state as UserLoaded)
          .pengguna
          .copyWith(name: event.name, profilePictureUrl: event.profileImage);

      await PenggunaServices.updateUser(updatedPengguna);

      yield UpdatedUserLoaded(updatedPengguna);
    }
  }
}
