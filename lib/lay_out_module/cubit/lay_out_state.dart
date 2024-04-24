part of 'lay_out_cubit.dart';

@immutable
abstract class LayOutState {}

class LayOutInitial extends LayOutState {}

class SwitchCategoryState extends LayOutState {}
class AddState extends LayOutState {}
class MinasState extends LayOutState {}
class FavState extends LayOutState {}


class CategoryStateLoading extends LayOutState {}
class CategoryStateSuccess extends LayOutState {}
class CategoryStateError extends LayOutState {}

class RecommendedModelStateLoading extends LayOutState {}
class RecommendedModelStateSuccess extends LayOutState {}
class RecommendedModelStateError extends LayOutState {}


class ToggleFavoriteStateLoading extends LayOutState {}
class ToggleFavoriteStateSuccess extends LayOutState {}
class ToggleFavoriteStateError extends LayOutState {}


class GetFavoriteStateLoading extends LayOutState {}
class GetFavoriteStateSuccess extends LayOutState {}
class GetFavoriteStateError extends LayOutState {}


