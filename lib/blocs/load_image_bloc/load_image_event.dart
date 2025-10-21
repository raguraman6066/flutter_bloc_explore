sealed class LoadImageEvent {}

final class LoadButtonPressedEvent extends LoadImageEvent {
  // final String imageUrl;
  // LoadButtonPressedEvent({required this.imageUrl});
}

final class RemoveButtonPressedEvent extends LoadImageEvent {}
