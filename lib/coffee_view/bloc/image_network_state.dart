part of 'image_network_cubit.dart';

enum ImageNetworkStatus {
  initial,
  inProgress,
  success,
  error
}

class ImageNetworkState extends Equatable {
  const ImageNetworkState({
    this.imageNetworkData,
    this.imageNetworkStatus = ImageNetworkStatus.initial,
  });

  // TODO(gthompson333): Ideally this should be a generic abstract type and not
  // TODO(gthompson333): pinned to any concrete implementation.
  final AlexCoffee? imageNetworkData;

  final ImageNetworkStatus imageNetworkStatus;

  ImageNetworkState copyWith({
    required ImageNetworkStatus status,
    AlexCoffee? coffeeData,
  }) {
    return ImageNetworkState(
      imageNetworkData: coffeeData ?? imageNetworkData,
      imageNetworkStatus: status,
    );
  }

  @override
  List<Object?> get props => [imageNetworkData, imageNetworkStatus];
}
