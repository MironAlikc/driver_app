import 'package:driver_app/feature/auth/repositoey/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LogInEvent>(
      (event, emit) async {
        try {
          await repository.getToken(
            password: event.password,
            username: event.username,
          );
          emit(AuthSucces());
        } catch (e) {
          emit(AuthError());
        }
      },
    );
  }
  final AuthRepository repository;
}
