import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/token_model.dart';
import '../repositories/registration_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required this.repository}) : super(RegistrationInitial()) {
    on<SendCodeEvent>(
      (event, emit) async {
        emit(RegistrationLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          final model = await repository.registration(otp: event.otp);
          emit(RegistrationSucces(model: model));
        } catch (e) {
          emit(RegistrationError());
        }
      },
    );
  }
  final RegistrationRepository repository;
}
