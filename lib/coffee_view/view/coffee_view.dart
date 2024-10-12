import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/coffee_image_cubit.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CoffeeImageCubit, CoffeeState>(
        builder: (context, state) {
          switch (state.coffeeStatus) {
            case CoffeeStatus.success:
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - (40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(state.coffeeData!.file),
                  ),
                ),
              );
            case CoffeeStatus.inProgress:
              return const Center(
                child: RefreshProgressIndicator(),
              );
            case CoffeeStatus.error:
              return const Center(
                child: Text('ERROR: Unable to fetch a coffee image.'),
              );
            case CoffeeStatus.initial:
              return const Center(
                child: Text('Initializing ...'),
              );
          }
        },
      ),
    );
  }
}
