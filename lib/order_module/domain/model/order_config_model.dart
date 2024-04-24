class OrderConfigModel {
  final Data data;

  const OrderConfigModel({required this.data});

  factory OrderConfigModel.fromjson(Map<String, dynamic> json) =>
      OrderConfigModel(
        data: Data.fromjson(json['data']),
      );
}

class Data {
  Data({
    required this.deliveryFee,
    required this.startTime,
    required this.tax,
    required this.endTime,
  });

  final String tax;
  final String deliveryFee;
  final String startTime;
  final String endTime;

  factory Data.fromjson(Map<String, dynamic> json) => Data(
        deliveryFee: json["delivery_fee"],
        startTime: json["start_time"],
        tax: json["tax"],
        endTime: json["end_time"],
      );
}
