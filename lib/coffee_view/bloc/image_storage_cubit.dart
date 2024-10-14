import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gal/gal.dart';

part 'image_storage_state.dart';

class ImageStorageCubit extends Cubit<ImageStorageState> {
  ImageStorageCubit() : super(const ImageStorageState());

  Future<void> saveImageToGallery(String imagePath) async {
    emit(state.copyWith(status: ImageStorageStatus.inProgress));

    try {
      final imageResponse = await Dio().get<List<int>>(
        imagePath,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      if (imageResponse.data == null || imageResponse.data!.isEmpty) {
        log('Error! Image data is invalid.');
        emit(state.copyWith(status: ImageStorageStatus.error));
      } else {
        await Gal.putImageBytes(
          Uint8List.fromList(imageResponse.data!),
          album: 'Very Good Coffee',
        );
        log('Success! Image saved to photo gallery.');
        emit(state.copyWith(status: ImageStorageStatus.success));
      }
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(status: ImageStorageStatus.error));
    }
  }

  Future<void> showImageGallery() async {
    await Gal.open();
  }
}
