import 'package:flutter/material.dart';

class CustomFloatinActionButton extends StatelessWidget {
  const CustomFloatinActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: () {},
      backgroundColor: const Color(0xff991220),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
