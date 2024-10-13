import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/coffee_image_cubit.dart';
import 'package:very_good_coffee_app/constants.dart';

class CoffeeView extends StatelessWidget {
  const CoffeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Very Good Coffee App'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CoffeeImageCubit>().fetchCoffeeImage();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<CoffeeImageCubit, CoffeeState>(
        builder: (context, state) {
          switch (state.coffeeStatus) {
            case CoffeeStatus.success:
              return Column(
                children: [
                  verticalSpace60,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                    ),
                  ),
                ],
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
