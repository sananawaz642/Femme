class TrouserModel {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final double review;
  final double star;
  final String description;
  // final String Shirt;
  final String Fabric;
  final String Color;
  final String height;
  final String wear;
  int value;

  TrouserModel( {
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.review,
    required this.star,
    required this.description,
    // required this.Shirt,
    required this.Fabric,
    required this.Color,
    required this.height,
    required this.wear,
    required this.value
  });
}