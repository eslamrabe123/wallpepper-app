// import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallpapper/shared/textItem.dart';

class DropDownItem<T> extends StatefulWidget {
  DropDownItem(
      {Key? key,
      required this.options,
      required this.onChanged,
      this.inistialValue,
      this.onTap,
      this.itemAsString})
      : super(key: key);
  Function(int)? onTap;
  List<T> options;
  final T? inistialValue;
  final String Function(T)? itemAsString;
  Function(T) onChanged;

  @override
  State<DropDownItem<T>> createState() => _DropDownItemState<T>();
}

class _DropDownItemState<T> extends State<DropDownItem<T>> {
  TextEditingController controller = TextEditingController();
  double width = 0.0;

  @override
  void initState() {
    controller = TextEditingController(text: widget.inistialValue?.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            value: widget.inistialValue,
            onTap: () {
              widget.onTap;
            },
            validator: (value) {
              if (value == null) {
                return 'Please select an option'.tr();
              }
              return null;
            },
            hint: const Row(
              children: [
                // 20.pw,
                TextItem(
                  text: 'أختر',
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.red,
              size: 30.h,
            ),
            items: widget.options
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        widget.itemAsString?.call(e) ?? e.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ))
                .toList(),
            onChanged: (s) {
              if (s == null) {
                "Test validation";
              }
              if (s != null) {
                widget.onChanged.call(s);
              }
            },
          ),
        )
      ],
    );
  }
}
