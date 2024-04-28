import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/lay_out_module/domain/model/category_model.dart';

import '../../../core/local/api/api.dart';
import '../model/get_favorites_model.dart';
import '../model/offers_model.dart';
import '../model/recommended_model.dart';

class LayOutRepository {
  DioService dioService;

  LayOutRepository(this.dioService);

  OffersModel? offersModel;

  getOffers() async {
    final response = await dioService.getData(url: "offers", loading: false);
    if (response.isError == false) {
      offersModel = OffersModel.fromJson(response.response?.data);
      return offersModel;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }

  GetFavoritesModel? getFavoritesModel;

  getFavorite() async {
    final response = await dioService.getData(url: "favorites", loading: false);
    if (response.isError == false) {
      getFavoritesModel = GetFavoritesModel.fromJson(response.response?.data);
      return getFavoritesModel;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }

  toggleFavoriteOrder({int? dishId}) async {
    final response = await dioService.postData(
        url: "toggle-favorite", loading: true, body: {"dish_id": dishId});
    if (response.isError == false) {
      return response.response?.data;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }

  CategoryModel? categoryModel;

  getCategory() async {
    final response = await dioService.getData(
      url: "home-categories",
      loading: false,
    );
    if (response.isError == false) {
      categoryModel = CategoryModel.fromJson(response.response?.data);
      return categoryModel;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }

  RecommendedModel? recommendedModel;

  getRecommended() async {
    final response = await dioService.getData(
      url: "dishes",
      loading: false,
    );
    if (response.isError == false) {
      recommendedModel = RecommendedModel.fromJson(response.response?.data);
      return recommendedModel;
    } else {
      Fluttertoast.showToast(msg: response.response?.data["message"]);
    }
  }
}
