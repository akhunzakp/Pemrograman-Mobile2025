class Item {
  final String name;
  final int price; 
  final String? image; 
  final int? stock;
  final double? rating;

  const Item({
    required this.name,
    required this.price,
    this.image,
    this.stock,
    this.rating,
  });
}