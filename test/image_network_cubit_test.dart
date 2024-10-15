import 'package:alex_coffee_repository/alex_coffee_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_network_cubit.dart';

// TODO(gthompson333): Ideally, these unit tests will use mock data.
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
      'Emits [inProgress, success].  The success state will have a '
      'non-null alex coffee model object with a file path property.',
      build: () => imageNetworkCubit,
      act: (cubit) => cubit.fetchImageData(),
      expect: () => <dynamic>[
        const ImageNetworkState(
          imageNetworkStatus: ImageNetworkStatus.inProgress,
        ),
        isA<ImageNetworkState>()
            .having(
              (ins) => ins.imageNetworkStatus,
              'status',
              ImageNetworkStatus.success,
            )
            .having(
              (ins) => ins.imageNetworkData,
              'file',
              isA<AlexCoffee>().having((ac) => ac.file, 'file', isNotEmpty),
            ),
      ],
    );
  });
}
