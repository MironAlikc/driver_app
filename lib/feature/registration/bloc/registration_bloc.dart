import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/token_model.dart';
import '../repositories/registration_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required this.repository}) : super(RegistrationInitial()) {
    on<SendCodeEvent>(
      (event, emit) async {
        emit(RegistrationLoading());
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
