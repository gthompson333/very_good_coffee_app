part of 'image_storage_cubit.dart';

enum ImageStorageStatus { initial, inProgress, success, error }

class ImageStorageState extends Equatable {
  const ImageStorageState({
    this.imageStorageStatus = ImageStorageStatus.initial,
  });

  final ImageStorageStatus imageStorageStatus;

  ImageStorageState copyWith({
    required ImageStorageStatus status,
  }) {
    return ImageStorageState(
      imageStorageStatus: status,
    );
  }

  @override
  List<Object?> get props => [imageStorageStatus];
}
