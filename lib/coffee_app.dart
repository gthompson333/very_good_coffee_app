import 'package:alex_coffee_repository/alex_coffee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_network_cubit.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_storage_cubit.dart';
import 'package:very_good_coffee_app/coffee_view/view/coffee_view.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({
    required AlexCoffeeRepository coffeeRepository,
    super.key,
  }) : _coffeeRepository = coffeeRepository;

  // The instance of the coffee image data repository that will be used by
  // the bloc instance.
  final AlexCoffeeRepository _coffeeRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: MultiBlocProvider(
        providers: [
          // Bloc object responsible for image network events.
          BlocProvider(
            create: (context) =>
                ImageNetworkCubit(coffeeRepository: _coffeeRepository),
          ),
          // Bloc object responsible for image storage events.
          BlocProvider(
            create: (context) => ImageStorageCubit(),
          ),
        ],
        child: const CoffeeView(),
      ),
    );
  }
}
