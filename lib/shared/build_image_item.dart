// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:watad/cubit/cubit.dart';
// import 'package:watad/cubit/state.dart';
//
// class CounterPage extends StatefulWidget {
//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }
//
// class _CounterPageState extends State<CounterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterCubit(),
//       child: BlocConsumer<CounterCubit, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           final cubit = CounterCubit.get(context);
//
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Counter App'),
//             ),
//             body: Center(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           child: Container(
//                               color: cubit.type == 1 ? Colors.red : Colors.grey,
//                               child: const Text('Show Page Tow')),
//                           onTap: () {
//                             cubit.pageOne = true;
//                             cubit.type = 1;
//                             cubit.performAction();
//                           },
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           child: Container(
//                               color: cubit.type == 2 ? Colors.red : Colors.grey,
//                               child: const Text('Show Page Tow')),
//                           onTap: () {
//                             cubit.pageTow = true;
//                             cubit.type = 2;
//                             cubit.performAction();
//                           },
//                         ),
//                         const SizedBox(
//                           width: 15,
//                         ),
//                         GestureDetector(
//                           child: Container(
//                               color: cubit.type == 3 ? Colors.red : Colors.grey,
//                               child: const Text('Show Page Tow')),
//                           onTap: () {
//                             cubit.pageThree = true;
//                             cubit.type = 3;
//                             cubit.performAction();
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     cubit.type == 1
//                         ? Container(
//                             color: cubit.type == 1 ? Colors.red : Colors.grey,
//                             width: 200,
//                             height: 100,
//                           )
//                         : cubit.type == 2
//                             ? Container(
//                                 color: cubit.type == 2
//                                     ? const Color.fromARGB(255, 54, 244, 101)
//                                     : Colors.grey,
//                                 width: 200,
//                                 height: 100,
//                               )
//                             : Container(
//                                 color: cubit.type == 3
//                                     ? const Color.fromARGB(255, 184, 54, 244)
//                                     : Colors.grey,
//                                 width: 200,
//                                 height: 100,
//                               ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                   ]),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




import 'package:flutter/material.dart';

class BuildImageItem extends StatelessWidget {
  BuildImageItem({Key? key,  required this.onDelete,this.contractImage}) : super(key: key);
  PlatformFile? contractImage;
  VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: DottedBorder(
            dashPattern: const [
              1,2
            ],
            color: Colors.red,
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  children: [
                    const Text( "file1",maxLines: 1,overflow: TextOverflow.ellipsis),
                    SizedBox(height: 8.h,),
                    Text(getFileSizeString(
                        bytes: contractImage!.size
                    ))
                  ],
                ),

                SizedBox(width: 12.w),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.w),
                    child: Image.file(
                      File(contractImage?.path ?? ""),
                      width: 60.w,
                      height: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),

                GestureDetector(
                    onTap: onDelete,
                    child:const  Icon(Icons.delete_forever_outlined)
                ),
                Spacer(),

              ],
            ),
          ),
        ),
      ],
    );
  }
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["B", "Kb", "Mb", "Gb", "Tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

}