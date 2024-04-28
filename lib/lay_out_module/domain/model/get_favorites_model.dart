class GetFavoritesModel {
  GetFavoritesModel({
    required this.status,
    required this.data,
  });

  final int? status;
  final List<GetFavoritesModelDatum> data;

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<GetFavoritesModelDatum>.from(
              json["data"]!.map((x) => GetFavoritesModelDatum.fromJson(x))),
    );
  }
}

class GetFavoritesModelDatum {
  GetFavoritesModelDatum({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.price,
    required this.sales,
    required this.rating,
    required this.newDish,
    required this.time,
    this.isFav = true,
    required this.category,
    required this.features,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? avatar;
  final String? price;
  final int? sales;
  final int? rating;
  final int? newDish;
  final int? time;
  bool isFav;
  final Category? category;
  final List<Feature> features;

  factory GetFavoritesModelDatum.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModelDatum(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      avatar: json["avatar"],
      price: json["price"],
      sales: json["sales"],
      rating: json["rating"],
      newDish: json["new_dish"],
      time: json["time"],
      isFav: json["is_fav"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      features: json["features"] == null
          ? []
          : List<Feature>.from(
              json["features"]!.map((x) => Feature.fromJson(x))),
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.avatar,
  });

  final int? id;
  final String? name;
  final String? avatar;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      avatar: json["avatar"],
    );
  }
}

class Feature {
  Feature({
    required this.id,
    required this.name,
    required this.type,
    required this.data,
  });

  final int? id;
  final String? name;
  final int? type;
  final List<FeatureDatum> data;

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      data: json["data"] == null
          ? []
          : List<FeatureDatum>.from(
              json["data"]!.map((x) => FeatureDatum.fromJson(x))),
    );
  }
}

class FeatureDatum {
  FeatureDatum({
    required this.name,
    required this.price,
  });

  final String? name;
  final String? price;

  factory FeatureDatum.fromJson(Map<String, dynamic> json) {
    return FeatureDatum(
      name: json["name"],
      price: json["price"],
    );
  }
}
