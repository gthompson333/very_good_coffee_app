import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/coffee_view/view/coffee_view.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeView(),
    );
  }
}
