import 'package:get_it/get_it.dart';
import 'package:wallpapper/account_module/cubit/account_cubit.dart';
import 'package:wallpapper/auth_module/domain/repository/aut_repository.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_cubit.dart';
import 'package:wallpapper/lay_out_module/cubit/lay_out_cubit.dart';
import 'package:wallpapper/lay_out_module/domain/repository/repository.dart';
import 'package:wallpapper/order_module/cubit/order_cubit.dart';

import '../../account_module/domain/repository/repository.dart';
import '../../auth_module/cubit/auth_cubit.dart';
import '../../order_module/domain/repository/repository.dart';
import '../local/api/api.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  void init() {
    serviceLocator.registerLazySingleton(() => DioService());

    /// Auth CUBIT
    serviceLocator.registerFactory(() => AuthCubit(serviceLocator()));

    /// GENERAL CUBIT
    serviceLocator.registerFactory(() => GeneralCubit());

    /// LAYOUT CUBIT
    serviceLocator.registerFactory(() => LayOutCubit(serviceLocator()));

    // ORDER CUBIT
    serviceLocator.registerFactory(() => OrderCubit(serviceLocator()));
    // ACCOUNT CUBIT
    serviceLocator.registerFactory(() => AccountCubit(serviceLocator()));

    /// AUTH REPOSITORY
    serviceLocator.registerLazySingleton(
        () => AuthRepository(serviceLocator<DioService>()));

    /// LayOut REPOSITORY
    serviceLocator.registerLazySingleton(
        () => LayOutRepository(serviceLocator<DioService>()));

    /// ORDER REPOSITORY
    serviceLocator.registerLazySingleton(
        () => OrderRepository(serviceLocator<DioService>()));

    /// ORDER REPOSITORY
    serviceLocator.registerLazySingleton(
        () => AccountRepository(serviceLocator<DioService>()));

    // serviceLocator.registerLazySingleton<AuthRepository>(
    //     () => AuthRepository(serviceLocator()));
    //
    // /// TV SHOWS REPOSITORY
    //
    // serviceLocator.registerLazySingleton<BaseTVRepository>(
    //     () => TVRepository(serviceLocator()));
    //
    // /// All DATA SOURCE
    // serviceLocator.registerLazySingleton<BaseAllRemoteDataSource>(
    //     () => AllRemoteDataSource());
    //
    // /// MOVIES DATA SOURCE
    // serviceLocator.registerLazySingleton<BaseMoviesRemoteDataSource>(
    //     () => MoviesRemoteDataSource());
    //
    // /// TV SHOWS DATA SOURCE
    //
    // serviceLocator.registerLazySingleton<BaseTVRemoteDataSource>(
    //     () => TVRemoteDataSource());
  }
}
