class GetUserDataModel {
  GetUserDataModel({
    required this.status,
    required this.data,
    required this.message,
    required this.accessToken,
    required this.tokenType,
  });

  final int? status;
  final Data? data;
  final String? message;
  final String? accessToken;
  final String? tokenType;

  factory GetUserDataModel.fromJson(Map<String, dynamic> json){
    return GetUserDataModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"],
      accessToken: json["access_token"],
      tokenType: json["token_type"],
    );
  }


}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.wallet,
    required this.blocked,
    required this.verificationCode,
    required this.phoneVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.otp,
    required this.verified,
    required this.fcmToken,
  });

  final int? id;
  final String? name;
  final dynamic email;
  final String? phone;
  final int? wallet;
  final int? blocked;
  final dynamic verificationCode;
  final dynamic phoneVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic image;
  final dynamic otp;
  final int? verified;
  final String? fcmToken;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      wallet: json["wallet"],
      blocked: json["blocked"],
      verificationCode: json["verification_code"],
      phoneVerifiedAt: json["phone_verified_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      image: json["image"],
      otp: json["otp"],
      verified: json["verified"],
      fcmToken: json["fcm_token"],
    );
  }

}
