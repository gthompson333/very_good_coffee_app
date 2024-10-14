import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_network_cubit.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_storage_cubit.dart';
import 'package:very_good_coffee_app/constants.dart';

class CoffeeView extends StatefulWidget {
  const CoffeeView({super.key});

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  String? coffeeImageFilePath;
  bool _isFavorite = false;

  @override
  void initState() {
    BlocProvider.of<ImageNetworkCubit>(context).fetchImageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Very Good Coffee App'),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<ImageStorageCubit>()
                  .saveImageToGallery(coffeeImageFilePath!);
            },
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {
              context.read<ImageStorageCubit>().showImageGallery();
            },
            icon: const Icon(Icons.image),
          ),
          IconButton(
            onPressed: () {
              context.read<ImageNetworkCubit>().fetchImageData();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocConsumer<ImageStorageCubit, ImageStorageState>(
        listener: (context, state) {
          if (state.imageStorageStatus == ImageStorageStatus.success) {
            _isFavorite = true;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Success! Image saved!'),
                duration: Duration(milliseconds: 2500),
              ),
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<ImageNetworkCubit, ImageNetworkState>(
            builder: (context, state) {
              switch (state.imageNetworkStatus) {
                case ImageNetworkStatus.success:
                  coffeeImageFilePath = state.imageNetworkData!.file;
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
                case ImageNetworkStatus.inProgress:
                  return const Center(
                    child: RefreshProgressIndicator(),
                  );
                case ImageNetworkStatus.error:
                  return const Center(
                    child: Text('ERROR: Unable to fetch a coffee image.'),
                  );
                case ImageNetworkStatus.initial:
                  return const Center(
                    child: Text('Initializing ...'),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
