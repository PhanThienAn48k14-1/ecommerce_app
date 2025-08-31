class Category {
  final int id;
  final String name;
  final String image;
  final String slug;

  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) { // này là chuyển đổi json dạng key value sang dạng định nghĩa theo ý mình
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      slug: json['slug'] as String,
    );
  }
}

class Product {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final Category category;
  final List<String> images;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int, //mục đích của các dòng này là để ép kiểu theo value được chọn, ví dụ ép kiểu id theo key id từ kiểu dynamic sang int
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      images: List<String>.from(json['images'] as List),
      isFavorite: false,
    );
  }
}

