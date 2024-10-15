import 'package:alex_coffee_repository/alex_coffee_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_network_cubit.dart';

void main() {
  group(ImageNetworkCubit, () {
    late ImageNetworkCubit imageNetworkCubit;

    setUp(() {
      imageNetworkCubit =
          ImageNetworkCubit(coffeeRepository: AlexCoffeeRepository());
    });

    test('Initial state of the cubit is the initial state.', () {
      expect(
        imageNetworkCubit.state.imageNetworkStatus,
        equals(ImageNetworkStatus.initial),
      );
    });

    blocTest<ImageNetworkCubit, ImageNetworkState>(
      'Emits two states. First one for in progress and the second one '
      'for successfully saving the image.',
      build: () => imageNetworkCubit,
      act: (cubit) => cubit.fetchImageData(),
      expect: () => [isA<ImageNetworkState>(), isA<ImageNetworkState>()],
    );
  });
}
