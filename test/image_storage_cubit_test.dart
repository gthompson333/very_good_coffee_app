import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee_app/coffee_view/bloc/image_storage_cubit.dart';

void main() {
  group(ImageStorageCubit, () {
    late ImageStorageCubit imageStorageCubit;

    setUp(() {
      imageStorageCubit = ImageStorageCubit();
    });

    test('Initial state of the cubit is the initial state.', () {
      expect(
        imageStorageCubit.state.imageStorageStatus,
        equals(ImageStorageStatus.initial),
      );
    });

    blocTest<ImageStorageCubit, ImageStorageState>(
      'Emits two states. First one for in progress and the second one '
      'for successfully saving the image.',
      build: () => imageStorageCubit,
      act: (cubit) => cubit.saveImageToGallery(
          'https://coffee.alexflipnote.dev/-q0ir1z5fs0_coffee.jpg',),
      expect: () => [isA<ImageStorageState>(), isA<ImageStorageState>()],
    );
  });
}
