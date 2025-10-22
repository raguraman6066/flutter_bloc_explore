import 'package:blocexplore/blocs/load_image_bloc/load_image_event.dart';
import 'package:blocexplore/blocs/load_image_bloc/load_image_state.dart';
import 'package:blocexplore/image_data.dart';
import 'package:blocexplore/models/my_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadImageBloc extends Bloc<LoadImageEvent, LoadImageState> {
  LoadImageBloc() : super(ImageNotLoadingState()) {
    on<LoadButtonPressedEvent>((event, emit) async {
      // emit(ImageLoadingState());
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
    });
    on<RemoveButtonPressedEvent>((event, emit) async {
      emit(ImageNotLoadingState());
    });
  }

  @override
  void onChange(Change<LoadImageState> change) {
    super.onChange(change);
    print("onchange observer: ");
    print(change.currentState.toString());
    print(change.nextState.toString());
  }

  @override
  void onTransition(Transition<LoadImageEvent, LoadImageState> transition) {
    super.onTransition(transition);
    print("onTransition observer: ");
    print(transition.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("onError Observer: ");
    print(error.toString());
  }

  @override
  void onEvent(LoadImageEvent event) {
    super.onEvent(event);
    print("OnEvent Observer: ");
    print(event.toString());
  }
}
