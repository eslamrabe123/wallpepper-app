import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/textItem.dart';
import '../../shared/text_field_item.dart';
import '../component/category_item.dart';
import '../../shared/drawer.dart';
import '../component/recommended_item.dart';
import '../cubit/lay_out_cubit.dart';
import 'recommended_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()
        ..getCategory()
        ..getRecommended(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);

          return Scaffold(
            drawer: DrawerWidget(),
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomAppBar(
                          title: "Logo here",
                          leading: Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                icon: SvgPicture.asset(
                                  "assets/images/Button Menu.svg",
                                ),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              );
                            },
                          ),
                          action: TextButton(
                            onPressed: () {},
                            child: const Text("clixk"),
                          ),
                          padding: 0.0,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.r),
                          child: const TextItem(
                            text: 'Hello Babe!',
                            textSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff959FA8),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.r),
                          child: const TextItem(
                            text: 'Please call me Now 💋!',
                            textSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffCB0006),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.r),
                          child: TextFieldItem(
                            hintText: "Search",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_alt_outlined,
                              ),
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
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
                    padding: EdgeInsets.only(
                      left: 10.0.r,
                      right: 10.0.r,
                      top: 16.0.r,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.categoryModel?.data.length ?? 5,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      left: 16.0.r,
                      right: 4.0.r,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextItem(
                            text: "Recommended",
                            color: Color(0xff40484E),
                            textSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RecommendedListView()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const TextItem(
                                    text: "See all",
                                    color: Color(0xffFC4747),
                                    textSize: 14,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                    color: Color(0xffFC4747),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  cubit.currentIndex == 0
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              cubit.index = index;

                              return RecommendedItem(
                                nweIndex: index,
                                index: index,
                              );
                            },
                            childCount: 5,
                          ),
                        )
                      : SliverToBoxAdapter(
                          child: Center(
                            heightFactor: 3.0,
                            child: Container(
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.amber,
                              ),
                              child: const TextItem(
                                text: "IN PROGRESS !",
                                color: Colors.white,
                                textSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
