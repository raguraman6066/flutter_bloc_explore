import 'package:blocexplore/blocs/load_image_bloc/load_image_event.dart';
import 'package:blocexplore/blocs/load_image_bloc/load_image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadImageBloc extends Bloc<LoadImageEvent, LoadImageState> {
  LoadImageBloc() : super(ImageNotLoadingState()) {
    on<LoadButtonPressedEvent>((event, emit) async {
      emit(ImageLoadingState());
      await Future.delayed(Duration(seconds: 1));
      emit(ImageLoadedState());
    });
    on<RemoveButtonPressedEvent>((event, emit) async {
      emit(ImageNotLoadingState());
    });
  }
}
