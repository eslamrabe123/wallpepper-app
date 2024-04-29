class OrderModel {
  String? image;
  String? name;
  String? price;
  String? category;
  int quantity;
  Function()? onRemove;

  OrderModel({
    this.image,
    this.name,
    this.price,
    this.category,
    this.quantity = 0,
    this.onRemove,
  });
}
