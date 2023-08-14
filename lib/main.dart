import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poke_api/di/dependency_injection.dart';
import 'package:flutter_poke_api/presentation/cubit/pokedex_page_cubit.dart';
import 'package:flutter_poke_api/presentation/landing_page.dart';
import 'package:flutter_poke_api/presentation/pokedex_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexPageCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
        home: const LandingPage(),
      ),
    );
  }
}
