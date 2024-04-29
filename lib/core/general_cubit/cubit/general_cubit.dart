import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpapper/core/general_cubit/cubit/general_state.dart';
import 'package:wallpapper/core/utiles/shared.dart';
import 'package:wallpapper/order_module/domain/model/order_model.dart';

import '../../utiles/utils.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitial());
  static GeneralCubit get(context) => BlocProvider.of(context);

  int? currentIndex = Utils.isLight == true ? 2 : 1;
  radioTogel({required int value}) {
    currentIndex = value;
    emit(RadioTogelState());
  }

  bool islight = Utils.isLight ?? true;

  changeTeme() {
    islight = !islight;
    CacheHelper.saveData(key: "theme", value: islight);
    Utils.isLight = CacheHelper.loadData(key: "theme");
    print(Utils.isLight);
    emit(ChangeThemeState());
  }

  List<OrderModel> itemModel = [
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
    OrderModel(
      image:
          'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
      name: 'Burder',
      price: '35',
      category: 'pizza',
    ),
  ];
}
