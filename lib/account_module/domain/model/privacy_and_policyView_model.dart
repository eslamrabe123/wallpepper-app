class PrivacyAndPolicyModel {
  PrivacyAndPolicyModel({
    required this.status,
    required this.data,
  });

  final int? status;
  final Data? data;

  factory PrivacyAndPolicyModel.fromJson(Map<String, dynamic> json){
    return PrivacyAndPolicyModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.title,
    required this.content,
  });

  final String? title;
  final String? content;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      title: json["title"],
      content: json["content"],
    );
  }

}
