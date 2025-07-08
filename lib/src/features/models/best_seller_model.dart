class BestSellerModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final double rate;

  BestSellerModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rate,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      rate: (json['rate'] as num).toDouble(),
    );
  }
}
