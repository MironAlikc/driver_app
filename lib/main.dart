import 'package:driver_app/core/dio_setting.dart';
import 'package:driver_app/feature/auth/bloc/auth_bloc.dart';
import 'package:driver_app/feature/auth/repositoey/auth_repository.dart';
import 'package:driver_app/feature/set_users_data/bloc/set_users_data_bloc.dart';
import 'package:driver_app/feature/set_users_data/repositories/set_users_data_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feature/auth/auth_screen.dart';
import 'feature/registration/bloc/registration_bloc.dart';
import 'feature/registration/repositories/registration_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      // много Provider
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => RegistrationRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationBloc(
              repository:
                  RepositoryProvider.of<RegistrationRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              repository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SetUsersDataBloc(
              repository:
                  RepositoryProvider.of<SetUsersDataRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.ibmPlexMonoTextTheme(),
          ),
          home: const AuthScreen(),
          //  home: const SetUsersDataScreen(),
          // home: const SplashScreen(),
          // home: HomePage(),
        ),
      ),
    );
  }
}
