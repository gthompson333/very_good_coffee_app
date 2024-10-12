part of 'coffee_image_cubit.dart';

enum CoffeeStatus { initial, inProgress, success, error }

class CoffeeState extends Equatable {
  const CoffeeState({
    this.coffeeData,
    this.coffeeStatus = CoffeeStatus.initial,
  });

  // TODO(gthompson333): Ideally this should be a generic abstract type and not
  // TODO(gthompson333): pinned to any concrete implementation.
  final AlexCoffee? coffeeData;

  final CoffeeStatus coffeeStatus;

  CoffeeState copyWith({
    required CoffeeStatus status,
    AlexCoffee? coffeeData,
  }) {
    return CoffeeState(
      coffeeData: coffeeData ?? this.coffeeData,
      coffeeStatus: status,
    );
  }

  @override
  List<Object?> get props => [coffeeData, coffeeStatus];
}
