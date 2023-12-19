import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/screens/home.dart';
import 'package:pokedex/utility/theme/CustomTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Pokedex',
        theme: CustomTheme().initialTheme,
        home: const Home());
  }
}
