import 'package:driver_app/core/theme/app_fonts.dart';
import 'package:driver_app/core/widgets/custom_button.dart';
import 'package:driver_app/core/widgets/custom_text_field.dart';
import 'package:driver_app/feature/registration/registration_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerUserName = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Введите логин и пароль"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Добро пожаловать! введите логин и пароль",
                style: AppFonts.w700s25,
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                controller: controllerUserName,
                hintText: 'Username',
              ),
              CustomTextField(
                controller: controllerPassword,
                hintText: 'Password',
              ),
              CustomButton(
                onPressed: () {},
                title: "Войти",
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ),
                  );
                },
                child: const Text('Регистрация'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
