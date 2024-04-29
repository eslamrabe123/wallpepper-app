// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:wallpapper/core/services/services_locator.dart';
// import 'package:wallpapper/lay_out_module/cubit/lay_out_cubit.dart';
//
// import '../../core/themes/app_colors/app_colors_light.dart';
// import '../../shared/custom_appbar.dart';
// import '../../shared/textItem.dart';
// import '../../shared/text_field_item.dart';
// import '../component/recommended_item.dart';
//
// class RecListViewScreen extends StatelessWidget {
//   const RecListViewScreen({super.key});
//   final List<String> items = const [
//     "item 1 ",
//     "item 2 ",
//     "item 3 ",
//     "item 4 ",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => serviceLocator<LayOutCubit>()..getRecommended(),
//       child: BlocConsumer<LayOutCubit, LayOutState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           final cubit = LayOutCubit.get(context);
//           final length = cubit.recommendedModel?.data.length;
//           String items = "items".tr();
//           return Scaffold(
//             body: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.r,
//                     vertical: 8.0.r,
//                   ),
//                   child: CustomAppBar(
//                     title: "",
//                     leading: IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(Icons.arrow_back_ios)),
//                     action: TextButton(
//                       onPressed: () {},
//                       child: SvgPicture.asset("assets/images/Cart.svg"),
//                     ),
//                     padding: 0.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 18.0.w),
//                   child: TextFieldItem(
//                     hintText: "search".tr(),
//                     suffixIcon: IconButton(
//                       onPressed: () {},
//                       icon:
//                           SvgPicture.asset('assets/images/ionoptions.svg'),
//                     ),
//                     prefixIcon: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.search),
//                     ),
//                     onChange: (v) {},
//                     isPassword: false,
//                     validate: (v) {},
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 18.0.w),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       TextItem(
//                         text: "all".tr(),
//                         color: AppColorLight.allColor,
//                         textSize: 30.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       TextItem(
//                         text:
//                             "( ${cubit.recommendedModel?.data.length} $items )",
//                         color: AppColorLight.itemsColor,
//                         textSize: 14.sp,
//                       ),
//                       const Spacer(),
//                       TextButton(
//                         onPressed: () {},
//                         child: SvgPicture.asset(
//                           'assets/images/ionswap-vertical-outline.svg',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: NotificationListener<ScrollNotification>(
//                     onNotification: (notification)  {
//                       if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollEndNotification){
//                         cubit.getRecommended();
//                       }
//
//                       return true;
//                     },
//                     child: ListView.builder(
//                       physics: const ScrollPhysics(),
//                       itemCount: length ,
//                       itemBuilder: (context, index) {
//                         return RecommendedItem(
//                           nweIndex: index,
//                           index: index,
//                         );
//
//
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
