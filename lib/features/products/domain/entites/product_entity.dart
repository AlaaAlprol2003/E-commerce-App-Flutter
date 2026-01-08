class ProductEntity {
  final String sId;
  final String title;
  final num? sold;
  final List<String> images;
  final String description;
  final num quantity;
  final num price;
  final String imageCover;
  final num? ratingsQuantity;
  final num?ratingsAverage;
  final num? priceAfterDiscount; 
  final List<dynamic>? availableColors; 

  ProductEntity({
    required this.sId,
    required this.title,
    required this.sold,
    required this.images,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    this.priceAfterDiscount,
    this.availableColors,  this.ratingsQuantity,  this.ratingsAverage,
  });
}
