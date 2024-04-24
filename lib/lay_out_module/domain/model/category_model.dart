class CategoryModel {
  CategoryModel({
    required this.data,
  });

  final List<CategoryElement> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      data: json["data"] == null ? [] : List<CategoryElement>.from(json["data"]!.map((x) => CategoryElement.fromJson(x))),
    );
  }

}

class Dish {
  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.avatar,
    required this.price,
    required this.sales,
    required this.rating,
    required this.newDish,
    required this.time,
    required this.isFav,
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
  final bool? isFav;
  final CategoryElement? category;
  final List<Feature> features;

  factory Dish.fromJson(Map<String, dynamic> json){
    return Dish(
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
      category: json["category"] == null ? null : CategoryElement.fromJson(json["category"]),
      features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
    );
  }

}

class CategoryElement {
  CategoryElement({
    required this.id,
    required this.name,
    required this.avatar,
    required this.dishes,
  });

  final int? id;
  final String? name;
  final String? avatar;
  final List<Dish> dishes;

  factory CategoryElement.fromJson(Map<String, dynamic> json){
    return CategoryElement(
      id: json["id"],
      name: json["name"],
      avatar: json["avatar"],
      dishes: json["dishes"] == null ? [] : List<Dish>.from(json["dishes"]!.map((x) => Dish.fromJson(x))),
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

  factory Feature.fromJson(Map<String, dynamic> json){
    return Feature(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      data: json["data"] == null ? [] : List<FeatureDatum>.from(json["data"]!.map((x) => FeatureDatum.fromJson(x))),
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

  factory FeatureDatum.fromJson(Map<String, dynamic> json){
    return FeatureDatum(
      name: json["name"],
      price: json["price"],
    );
  }

}
