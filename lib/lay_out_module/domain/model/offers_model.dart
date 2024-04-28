class OffersModel {
  OffersModel({
    required this.data,
    required this.status,
  });

  final List<Datum> data;
  final int? status;

  factory OffersModel.fromJson(Map<String, dynamic> json){
    return OffersModel(
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      status: json["status"],
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.code,
    required this.value,
    required this.type,
    required this.image,
  });

  final int? id;
  final String? code;
  final int? value;
  final String? type;
  final String? image;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      code: json["code"],
      value: json["value"],
      type: json["type"],
      image: json["image"],
    );
  }

}
