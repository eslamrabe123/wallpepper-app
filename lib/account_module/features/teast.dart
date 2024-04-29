import 'package:flutter/material.dart';
import 'package:elastic_drawer/elastic_drawer.dart';

class IennerDrawer extends StatelessWidget {
  const IennerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ElasticDrawer(
      mainColor: Colors.white,
      drawerColor: const Color.fromARGB(255, 156, 25, 25),
      mainChild: const Column(children: [
        Text('MAIN content'),
      ]),
      drawerChild: const Column(children: [
        Text('DRAWER content'),
      ]),
    );
  }
}
