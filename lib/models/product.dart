class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });
}

final List<Product> products = [
  const Product(
    name: 'Shoes',
    category: 'Footwear',
    isFavorite: true,
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/nike.jpg',
    description: 'This is a description of the product 1',
  ),
  const Product(
    name: 'laptop',
    category: 'Electronics',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 2',
  ),
  const Product(
    name: 'jordan shoes',
    category: 'Footwear',
    price: 69.00,
    isFavorite: true,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 3',
  ),
  const Product(
    name: 'Puma',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of the product 4',
  ),
];