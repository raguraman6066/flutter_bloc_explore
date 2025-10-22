import 'package:blocexplore/blocs/load_image_bloc/load_image_state.dart';
import 'package:blocexplore/image_data.dart';
import 'package:blocexplore/models/my_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadImageCubit extends Cubit<LoadImageState> {
  LoadImageCubit() : super(ImageNotLoadingState());
  Future<void> loadImage() async {
    emit(ImageLoadingState());
    List<Map<String, dynamic>> fetchImages = await Future.delayed(
      Duration(seconds: 1),
      () {
        return imageData;
      },
    );
    List<MyImage> resultImages = fetchImages
        .map((image) => MyImage.fromJson(image))
        .toList();
    emit(ImageLoadedState(allImages: resultImages));
  }

  void removeImage() {
    emit(ImageNotLoadingState());
  }
}
