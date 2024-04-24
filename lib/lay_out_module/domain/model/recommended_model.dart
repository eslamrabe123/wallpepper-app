class RecommendedModel {
  RecommendedModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  final List<DishesModelDatum> data;
  final Links? links;
  final Meta? meta;

  factory RecommendedModel.fromJson(Map<String, dynamic> json){
    return RecommendedModel(
      data: json["data"] == null ? [] : List<DishesModelDatum>.from(json["data"]!.map((x) => DishesModelDatum.fromJson(x))),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class DishesModelDatum {
  DishesModelDatum({
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
  final Category? category;
  final List<Feature> features;

  factory DishesModelDatum.fromJson(Map<String, dynamic> json){
    return DishesModelDatum(
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
      category: json["category"] == null ? null : Category.fromJson(json["category"]),
      features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
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

  factory Category.fromJson(Map<String, dynamic> json){
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

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }

}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }

}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json){
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }

}
