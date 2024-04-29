class PendingOrdersModel {
  const PendingOrdersModel({
    required this.data,
    required this.status,
  });

  final List<dynamic> data;
  final int? status;

  factory PendingOrdersModel.fromJson(Map<String, dynamic> json) {
    return PendingOrdersModel(
      data: json["data"] == null
          ? []
          : List<dynamic>.from(json["data"]!.map((x) => x)),
      status: json["status"],
    );
  }
}
