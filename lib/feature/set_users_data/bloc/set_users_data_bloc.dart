import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/set_users_data_repositories.dart';

part 'set_users_data_event.dart';
part 'set_users_data_state.dart';

class SetUsersDataBloc extends Bloc<SetUsersDataEvent, SetUsersDataState> {
  SetUsersDataBloc({required this.repository}) : super(SetUsersDataInitial()) {
    on<SendDataEvent>(
      (event, emit) async {
        try {
          await repository.setPassword(password: event.password);
          await repository.setUserName(
            name: event.login,
            userName: event.login,
          );
          emit(SetUsersDataSucces());
        } catch (e) {
          emit(SetUsersDataError());
        }
      },
    );
  }
  final SetUsersDataRepository repository;
}
