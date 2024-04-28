import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpapper/core/services/services_locator.dart';
import 'package:wallpapper/shared/textItem.dart';
import '../../core/helper/my_loading.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/text_field_item.dart';
import '../cubit/lay_out_cubit.dart';
import '../component/recommended_item.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  static String id = "RecommendedListView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LayOutCubit>()..getRecommended(),
      child: BlocConsumer<LayOutCubit, LayOutState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LayOutCubit.get(context);

          return Scaffold(
            body: state is RecommendedStateLoading
                ? const Center(child: CircularProgressIndicator())
                : SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomAppBar(
                                title: "",
                                leading: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios)),
                                action: TextButton(
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                      "assets/images/Cart.svg"),
                                ),
                                padding: 0.0,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 18.0.r),
                                child: TextFieldItem(
                                  hintText: "Search",
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
                              horizontal: 5.0.r, vertical: 8.0.r),
                          sliver: SliverToBoxAdapter(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              const TextItem(
                                text: "All",
                                color: Color(0xffFC4747),
                                textSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextItem(
                                text:
                                    "(${cubit.recommendedModel?.data.length} items)",
                                color: const Color(0xff888888),
                                textSize: 14,
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
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return RecommendedItem(
                                nweIndex: index,
                                index: index,
                              );
                            },
                            childCount: cubit.recommendedModel?.data.length,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
