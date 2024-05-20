import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/lay_out_module/domain/model/category_model.dart';
import '../../../core/local/api/api.dart';
import '../../../core/themes/app_colors/app_colors_light.dart';
import '../../../core/themes/color_themes.dart';
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
      Fluttertoast.showToast(
        msg: response.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  GetFavoritesModel? getFavoritesModel;

  getFavorite() async {
    final response = await dioService.getData(url: "favorites", loading: false);
    if (response.isError == false) {
      getFavoritesModel = GetFavoritesModel.fromJson(response.response?.data);
      return getFavoritesModel;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  toggleFavoriteOrder({int? dishId}) async {
    final response = await dioService.postData(
        url: "toggle-favorite", loading: true, body: {"dish_id": dishId});
    if (response.isError == false) {
      return response.response?.data;
    } else {
      Fluttertoast.showToast(
        msg: response.response?.data["message"],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
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
      Fluttertoast.showToast(
        msg: 'Category Not Found',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }

  RecommendedModel? recommendedModel;

  getRecommended(int page) async {
    final response = await dioService.getData(
      url: "dishes?page=$page",
      loading: false,
    );
    if (response.isError == false) {
      recommendedModel = RecommendedModel.fromJson(response.response?.data);
      page++;
      // list.add(recommendedModel?.data);
      return recommendedModel;
    } else {
      Fluttertoast.showToast(
        msg: 'Recommended Not Found',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColorLight.primaryColor,
        textColor: Colors.white,
        fontSize: 12.0,
      );
    }
  }
}
