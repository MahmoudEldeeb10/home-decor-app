class NewCollectionModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final bool isSale;
  final double? salePrice;
  final String image;
  final double rate;

  NewCollectionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isSale,
    this.salePrice,
    required this.image,
    required this.rate,
  });

  factory NewCollectionModel.fromJson(Map<String, dynamic> json) {
    return NewCollectionModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      isSale: json['is_sale'],
      salePrice: json['sale_price'] != null
          ? (json['sale_price'] as num).toDouble()
          : null,
      image: json['image'],
      rate: (json['rate'] as num).toDouble(),
    );
  }
}
