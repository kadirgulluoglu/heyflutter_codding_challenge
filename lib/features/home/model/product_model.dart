class ProductModel {
  final int id;
  final String name;
  final String showCaseImage;
  final String roomLength;
  final double price;
  final double stars;
  final List<String> images;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.showCaseImage,
    required this.images,
    required this.roomLength,
    required this.price,
    required this.stars,
    required this.description,
  });
}
