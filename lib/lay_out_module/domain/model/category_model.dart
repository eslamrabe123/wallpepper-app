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


class CategoryElement {
  CategoryElement({
    required this.id,
    required this.name,
    required this.avatar,
  });

  final int? id;
  final String? name;
  final String? avatar;

  factory CategoryElement.fromJson(Map<String, dynamic> json){
    return CategoryElement(
      id: json["id"],
      name: json["name"],
      avatar: json["avatar"],
    );
  }

}


