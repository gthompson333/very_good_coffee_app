import 'package:alex_coffee_repository/alex_coffee_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffee_image_state.dart';

class CoffeeImageCubit extends Cubit<CoffeeState> {
  CoffeeImageCubit({required AlexCoffeeRepository coffeeRepository})
      : _coffeeRepository = coffeeRepository,
        super(const CoffeeState());

  final AlexCoffeeRepository _coffeeRepository;

  Future<void> fetchCoffeeImage() async {
    emit(state.copyWith(status: CoffeeStatus.inProgress));
    try {
      final alexCoffee = await _coffeeRepository.fetchCoffee();
      emit(
        state.copyWith(coffeeData: alexCoffee, status: CoffeeStatus.success),
      );
    } catch (e) {
      emit(state.copyWith(status: CoffeeStatus.error));
    }
  }
}
