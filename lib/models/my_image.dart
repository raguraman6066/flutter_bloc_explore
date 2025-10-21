class MyImage {
  final String url;
  final double size;
  MyImage({required this.url, required this.size});
  factory MyImage.fromJson(Map<String, dynamic> data) {
    return MyImage(url: data['url'], size: data['size']);
  }
}
