import 'package:driver_app/core/theme/app_fonts.dart';
import 'package:driver_app/core/widgets/custom_button.dart';
import 'package:driver_app/core/widgets/custom_text_field.dart';
import 'package:driver_app/feature/auth/auth_screen.dart';
import 'package:driver_app/feature/registration/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerOtp = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Введите код подтверждения'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Введите код подтверждения',
                style: AppFonts.w700s25,
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                controller: controllerOtp,
                maxLength: 4,
                onChanged: (val) {}, 
              ),
              BlocConsumer<RegistrationBloc, RegistrationState>(
                listener: (context, state) {
                  if (state is RegistrationSucces) {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     // если состояние успешное тогда перекин на экран SetUsersDataScreen
                    //     builder: (context) => const SetUsersDataScreen(),
                    //   ),
                    // );
                  }
                },
                builder: (context, state) {
                  if (state is RegistrationLoading) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  return CustomButton(
                    onPressed: () {
                      BlocProvider.of<RegistrationBloc>(context)
                          .add(SendCodeEvent(otp: controllerOtp.text));
                    },
                    title: 'Войти',
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                  );
                },
                child: const Text('Войти'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
