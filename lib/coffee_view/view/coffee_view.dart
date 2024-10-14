import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/coffee_image_cubit.dart';
import 'package:very_good_coffee_app/constants.dart';

class CoffeeView extends StatefulWidget {
  const CoffeeView({super.key});

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  String? coffeeImageFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Very Good Coffee App'),
        actions: [
          IconButton(
            onPressed: () async {
              log(coffeeImageFilePath!);
              await _saveNetworkImage(coffeeImageFilePath!);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved! ✅'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              context.read<CoffeeImageCubit>().fetchCoffeeFileData();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<CoffeeImageCubit, CoffeeState>(
        builder: (context, state) {
          switch (state.coffeeStatus) {
            case CoffeeStatus.success:
              coffeeImageFilePath = state.coffeeData!.file;
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
                          // CoffeeData should never be null here.
                          image: NetworkImage(coffeeImageFilePath!),
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

  Future<void> _saveNetworkImage(String imagePath) async {
    final imageResponse = await Dio().get<List<int>>(
      imagePath,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    await Gal.putImageBytes(Uint8List.fromList(imageResponse.data!),
        album: 'Very Good Coffee');
  }
}
