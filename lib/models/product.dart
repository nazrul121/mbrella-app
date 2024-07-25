class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final List<String> categories; // Assuming products can belong to multiple categories

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categories,
  });
}

class Filter {
  final String name;
  final bool isSelected;

  Filter({
    required this.name,
    this.isSelected = false,
  });
}
