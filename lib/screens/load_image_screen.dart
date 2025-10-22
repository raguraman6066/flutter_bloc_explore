import 'package:blocexplore/blocs/load_image_bloc/load_image_bloc.dart';
import 'package:blocexplore/blocs/load_image_bloc/load_image_event.dart';
import 'package:blocexplore/blocs/load_image_bloc/load_image_state.dart';
import 'package:blocexplore/cubits/load_image_cubit/load_image_cubit.dart';
import 'package:blocexplore/models/my_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadImageScreen extends StatefulWidget {
  const LoadImageScreen({super.key});

  @override
  State<LoadImageScreen> createState() => _LoadImageScreenState();
}

class _LoadImageScreenState extends State<LoadImageScreen> {
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    print("Complete UI Rebuild");
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Load Image with setState"),
        // title: const Text("Load Image with bloc"),
        title: const Text("Load Image with cubit"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       imageUrl.isEmpty
      //           ? const Text("No Image")
      //           : Image.network(imageUrl, height: 250.0, width: 250.0),
      //       const SizedBox(height: 100),
      //       ElevatedButton(
      //         onPressed: () {
      //           if (imageUrl.isEmpty) {
      //             setState(() {
      //               imageUrl =
      //                   "https://lwfiles.mycourse.app/droidcon-public/f11ed54687792408d5dfc847bf926bae.png";
      //             });
      //           } else {
      //             setState(() {
      //               imageUrl = "";
      //             });
      //           }
      //         },
      //         child: imageUrl.isEmpty
      //             ? const Text("Load Image")
      //             : const Text("Remove Image"),
      //       ),
      //     ],
      //   ),
      // ),
      // body: BlocConsumer<LoadImageBloc, LoadImageState>(
      body: BlocConsumer<LoadImageCubit, LoadImageState>(
        listener: (context, state) {
          if (state is ImageLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Image Loaded Successfully!!")),
            );
          }
        },
        builder: (context, state) {
          print("Bloc Rebuilding");
          if (state is ImageLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ImageLoadedState) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(state.allImages, width: 250, height: 250),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 30,
                      ),
                      itemCount: state.allImages.length,
                      itemBuilder: (context, index) {
                        MyImage myImage = state.allImages[index];
                        return Card(
                          child: Image.asset(
                            myImage.url,
                            width: myImage.size,
                            height: myImage.size,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 100),
                    ElevatedButton(
                      onPressed: () {
                        // context.read<LoadImageBloc>().add(
                        //   RemoveButtonPressedEvent(),
                        // );

                        context.read<LoadImageCubit>().removeImage();
                      },
                      child: Text("Remove Image"),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context.read<LoadImageBloc>().add(
                    //       LoadButtonPressedEvent(),
                    //     );
                    //   },
                    //   child: Text("Load Image"),
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Image"),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      // context.read<LoadImageBloc>().add(
                      //   LoadButtonPressedEvent(
                      //     // imageUrl: "images/berlin.jpg"
                      //   ),
                      // );
                      context.read<LoadImageCubit>().loadImage();
                    },
                    child: Text("Load Image"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
