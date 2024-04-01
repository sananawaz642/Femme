class ProductModel {
  final int id;
  final String imageUrl;
  final String name;
  final double price;
  final String description;
  final String type; //cotton, leather or linen etc
  final String color;
  final String unit; //Meter, Pcs, Size etc
  final String size;
  final String wear;
  final String note;

  ProductModel( {
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.type,
    required this.color,
    required this.unit,
    required this.size,
    required this.wear,
    required this.note,
  });
}