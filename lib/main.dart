import 'package:chefkart/screens/bloc/dishes_bloc.dart';
import 'package:chefkart/screens/dishes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DishesBloc(),
        child: AllDishes(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
