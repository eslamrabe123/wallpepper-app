import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapper/lay_out_module/domain/model/category_model.dart';

import '../domain/model/get_favorites_model.dart';
import '../domain/model/recommended_model.dart';
import '../domain/repository/repository.dart';

part 'lay_out_state.dart';

class LayOutCubit extends Cubit<LayOutState> {
  LayOutRepository layOutRepository;

  LayOutCubit(
      this.layOutRepository,
  ) : super(LayOutInitial());

  static LayOutCubit get(context) => BlocProvider.of(context);
  GetFavoritesModel? getFavoritesModel;

  getFavorite() async {
    emit(GetFavoriteStateLoading());
    final data = await layOutRepository.getFavorite();
    if (data != null) {
      emit(GetFavoriteStateSuccess());

      getFavoritesModel = data;
      return getFavoritesModel;
    } else {
      emit(GetFavoriteStateError());
    }
  }

  bool isLike = false;

  changeFavIconColor() {
    isLike = !isLike;
    emit(FavState());
    print("Color Changes !");
  }

  toggleFavorite({int? dishId}) async {
    emit(ToggleFavoriteStateLoading());
    final data = await layOutRepository.toggleFavoriteOrder(dishId: dishId);
    if (data != null) {
      emit(ToggleFavoriteStateSuccess());

      return data;
    } else {
      emit(ToggleFavoriteStateError());
    }
  }

  CategoryModel? categoryModel;

  getCategory() async {
    emit(CategoryStateLoading());
    final data = await layOutRepository.getCategory();
    if (data != null) {
      emit(CategoryStateSuccess());
      categoryModel = data;
      return categoryModel;
    } else {
      emit(CategoryStateError());
    }
  }

  RecommendedModel? recommendedModel;

  getRecommended() async {
    emit(RecommendedModelStateLoading());
    final data = await layOutRepository.getRecommended();
    if (data != null) {
      emit(RecommendedModelStateSuccess());
      recommendedModel = data;
      return recommendedModel;
    } else {
      emit(RecommendedModelStateError());
    }
  }

  int currentIndex = 0;
  bool all = false;
  bool main = false;
  bool pizza = false;
  bool appetiser = false;
  bool sweets = false;

  void switchCategory() {
    switch (currentIndex) {
      case 0:
        all = true;
        break;
      case 1:
        main = true;
        break;
      case 2:
        pizza = true;
        break;
      case 3:
        appetiser = true;
        break;
      case 4:
        sweets = true;
        break;
      default:
    }
    emit(SwitchCategoryState());
  }

  int x = 0;

  add() {
    x++;
    emit(AddState());
  }

  minas() {
    x--;
    emit(MinasState());
  }

  int? index;
}
