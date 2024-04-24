class CompletedOrdersModel {
  CompletedOrdersModel({
    required this.data,
    required this.status,
  });

  final List<dynamic> data;
  final int? status;

  factory CompletedOrdersModel.fromJson(Map<String, dynamic> json){
    return CompletedOrdersModel(
      data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
      status: json["status"],
    );
  }

}
