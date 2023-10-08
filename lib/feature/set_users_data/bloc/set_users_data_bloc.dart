// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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

