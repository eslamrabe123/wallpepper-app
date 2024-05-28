import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpapper/core/local/api/api.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/core/themes/app_colors/app_colors_light.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/text_field_item.dart';
import '../cubit/lay_out_cubit.dart';
import '../component/recommended_item.dart';
import '../domain/model/recommended_model.dart';

class RecommendedListView extends StatefulWidget {
  const RecommendedListView({super.key});

  static String id = "RecommendedListView";

  @override
  State<RecommendedListView> createState() => _RecommendedListViewState();
}

class _RecommendedListViewState extends State<RecommendedListView> {
  ScrollController controller = ScrollController();
  RecommendedModel? model;
  DioService dioService = serviceLocator<DioService>();

  List<DishesModelDatum> itemList = [];
  bool isLoading = false, allLoaded = false;

  int page = 1;

  getData({
    required int page,
  }) async {
    if (allLoaded) {
      // emit(AllLoadedState());
      return;
    }
    // emit(IsLoadingState());
    isLoading = true;
    final response = await dioService.getData(
      url: "dishes?page=$page",
      loading: false,
    );
    if (response.response?.statusCode == 200) {
      print("response = ${response.response?.statusCode}");
      model = RecommendedModel.fromJson(response.response?.data);

      if (model!.data.isNotEmpty) {
        itemList.addAll(model?.data.map((e) => e) ?? []);
        print(itemList.length);
        print("add to list");
      }
      setState(() {
        isLoading = false;
        allLoaded = model?.data.isEmpty ?? false;
      });
      return Fluttertoast.showToast(msg: "success");
    } else {
      return Fluttertoast.showToast(msg: "error");
    }
  }

  @override
  void initState() {
    super.initState();

    print("initState");
    getData(
      page: page,
    );
    print('calling get data');

    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent &&
          !isLoading) {
        page++;
        Fluttertoast.showToast(msg: "page++");
        print("itemList.length = ${itemList.length}");
        print("add page");

        getData(
          page: page,
        );
      }
    });
    print('page = $page');
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);
          String items = "items".tr();

          return Scaffold(
            body: state is RecommendedStateLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColorLight.primaryColor,
                  ))
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.0.h,
                                ),
                                child: CustomAppBar(
                                  title: "",
                                  leading: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back_ios)),
                                  action: TextButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const RecListViewScreen()));
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/Cart.svg"),
                                  ),
                                  padding: 0.0,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 18.0.w),
                                child: TextFieldItem(
                                  hintText: "search".tr(),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/images/ionoptions.svg'),
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search),
                                  ),
                                  onChange: (v) {},
                                  isPassword: false,
                                  validate: (v) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.0.w,
                            vertical: 8.0.h,
                          ),
                          sliver: SliverToBoxAdapter(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              TextItem(
                                text: "all".tr(),
                                color: AppColorLight.allColor,
                                textSize: 30.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextItem(
                                text: "( ${itemList.length} $items )",
                                color: AppColorLight.itemsColor,
                                textSize: 14.sp,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: SvgPicture.asset(
                                  'assets/images/ionswap-vertical-outline.svg',
                                ),
                              ),
                            ],
                          )),
                        ),

                        SliverToBoxAdapter(
                          child: LayoutBuilder(
                            builder: (context, constraints) => ListView.builder(
                                shrinkWrap: true,
                                controller: controller,
                                itemCount: itemList.length,
                                itemBuilder: (context, index) {
                                  return RecommendedItem(
                                    model: itemList[index],
                                  );
                                }),
                          ),
                        ),

                        // SliverList(

                        //   delegate: SliverChildBuilderDelegate(
                        //     (context, index) {

                        //       return RecommendedItem(
                        //         nweIndex: index,
                        //         index: index,
                        //       );
                        //     },
                        //     childCount: items.length,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
