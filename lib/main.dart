import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/app.dart';
import 'package:general_app/app/features/index.dart';
import 'package:general_app/bloc_observer.dart';
import 'package:general_app/core/config/firebase_options.dart';
import 'package:general_app/core/shared_preferences/shared_prefrences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await setup();
  runApp(MultiBlocProvider(providers: [
    // BlocProvider<AuthenticationCubit>(
    //     create: (_) => AuthenticationCubit(
    //           authenticationRepository: locator<AuthenticationRepository>(),
    //         )),
    BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
  ], child: const App()));
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();
  await SharedPrefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}