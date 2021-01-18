import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'ui/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Flutix());
}

class Flutix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        child: MultiBlocProvider(
            providers: [
              BlocProvider<PageBloc>(
                create: (context) => PageBloc(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => UserBloc(),
              ),
              BlocProvider<ThemeBloc>(
                create: (context) => ThemeBloc(),
              ),
              BlocProvider<MovieBloc>(
                create: (context) => MovieBloc()..add(FetchMovies()),
              ),
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: state.themeData,
                  home: Wrapper(),
                );
              },
            )));
  }
}
