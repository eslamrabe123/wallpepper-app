import 'package:flutter/material.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onPressed,
    required this.unSelectedItemColor,
    required this.selectedItemColor,
    required this.currentIndex,
  });

  final Function(int) onPressed;
  final Color unSelectedItemColor;
  final Color selectedItemColor;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.black,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      unselectedItemColor: unSelectedItemColor,
      selectedItemColor: selectedItemColor,
      selectedIconTheme: const IconThemeData(
        size: 20,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
        fontFamily: 'baloo bhaijaan 2',
        fontWeight: FontWeight.w500,
      ),
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontFamily: 'baloo bhaijaan 2',
        fontWeight: FontWeight.w500,
      ),
      showUnselectedLabels: true,
      onTap: onPressed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'طلبات التسعير',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'الحساب',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_outlined),
          label: 'المزيد',
        ),

      ],
    );
  }
}
