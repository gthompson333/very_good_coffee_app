import 'dart:developer';

import 'package:alex_coffee_repository/alex_coffee_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_network_state.dart';

class ImageNetworkCubit extends Cubit<ImageNetworkState> {
  ImageNetworkCubit({required AlexCoffeeRepository coffeeRepository})
      : super(const ImageNetworkState()) {
    _coffeeRepository = coffeeRepository;
  }

  late final AlexCoffeeRepository _coffeeRepository;

  Future<void> fetchImageData() async {
    emit(state.copyWith(status: ImageNetworkStatus.inProgress));
    try {
      final alexCoffee = await _coffeeRepository.fetchCoffeeFileData();
      log('Success! Image data fetched from network.');
      emit(
        state.copyWith(
          coffeeData: alexCoffee,
          status: ImageNetworkStatus.success,
        ),
      );
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(status: ImageNetworkStatus.error));
    }
  }
}
