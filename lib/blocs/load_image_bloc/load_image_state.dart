sealed class LoadImageState {}

final class ImageNotLoadingState extends LoadImageState {}

final class ImageLoadingState extends LoadImageState {}

final class ImageLoadedState extends LoadImageState {}
