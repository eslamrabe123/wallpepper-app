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

class RecommendedStateLoading extends LayOutState {}
class RecommendedStateSuccess extends LayOutState {}
class RecommendedStateError extends LayOutState {}


class ToggleFavoriteStateLoading extends LayOutState {}
class ToggleFavoriteStateSuccess extends LayOutState {}
class ToggleFavoriteStateError extends LayOutState {}


class GetFavoriteStateLoading extends LayOutState {}
class GetFavoriteStateSuccess extends LayOutState {}
class GetFavoriteStateError extends LayOutState {}

class GetOffersStateLoading extends LayOutState {}
class GetOffersStateSuccess extends LayOutState {}
class GetOffersStateError extends LayOutState {}

