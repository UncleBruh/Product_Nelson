class Product {
  final String id;
  final String title;
  final double price;
  final String category;
  final String image;
  final String rating;

  Product({required this.id, required this.title, required this.price, required this.category, required this.image, required this.rating});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      rating: json['rating']['rate'].toString(),
    );
  }

  bool isExpensive() {
    return price > 50;
  }

  String shortTitle() {
    if (title.length > 35) {
      return title.substring(0, 35) + '...';
    }
    return title;
  }
}
