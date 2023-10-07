part of 'registration_bloc.dart';

abstract class RegistrationEvent {}

class SendCodeEvent extends RegistrationEvent {
  String otp;
  SendCodeEvent({required this.otp});
}
