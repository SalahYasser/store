class ProductModel {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  const ProductModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      imageUrl: json['thumbnail'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
    );
  }
}
