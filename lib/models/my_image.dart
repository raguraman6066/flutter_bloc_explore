import 'package:equatable/equatable.dart';

class MyImage extends Equatable {
  final String url;
  final double size;
  MyImage({required this.url, required this.size});
  factory MyImage.fromJson(Map<String, dynamic> data) {
    return MyImage(url: data['url'], size: data['size']);
  }

  @override
  List<Object?> get props => [url, size];
}
