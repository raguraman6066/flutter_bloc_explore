import 'package:blocexplore/models/my_image.dart';

sealed class LoadImageState {}

final class ImageNotLoadingState extends LoadImageState {}

final class ImageLoadingState extends LoadImageState {}

final class ImageLoadedState extends LoadImageState {
  final List<MyImage> allImages;
  ImageLoadedState({required this.allImages});
}
