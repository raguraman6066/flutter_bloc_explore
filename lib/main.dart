import 'package:blocexplore/blocs/load_image_bloc/load_image_bloc.dart';
import 'package:blocexplore/counterapp/counter/counter_bloc.dart';
import 'package:blocexplore/counterapp/counterapp.dart';
import 'package:blocexplore/cubits/load_image_cubit/load_image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './screens/load_image_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoadImageBloc()),
        BlocProvider(create: (context) => LoadImageCubit()),
      ],
      // create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blocify',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoadImageScreen(),
        // home: const CounterApp(),
      ),
    );
  }
}
