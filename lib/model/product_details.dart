class Product {
  final String itemName;
  final String path;
  final String itemDetails;
  final String itemPrice;
  Product(
      {required this.itemName,
      required this.path,
      required this.itemDetails,
      required this.itemPrice});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      itemName: json['name'],
      path: json['path'],
      itemDetails: json['details'],
      itemPrice: json['price'],
    );
  }
}
