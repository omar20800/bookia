// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/features/cart/presentation/screens/mycart_screen.dart';
import 'package:bookia/features/home/presentation/screens/home_screen.dart';
import 'package:bookia/features/profile/presentation/screens/profile_screen.dart';
import 'package:bookia/features/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    WishlistScreen(),
    MycartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColours.primaryColor,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
              color: currentIndex == 0 ? AppColours.primaryColor : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Bookmark.svg',
              color: currentIndex == 1 ? AppColours.primaryColor : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Category.svg',
              color: currentIndex == 2 ? AppColours.primaryColor : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Profile.svg',
              color: currentIndex == 3 ? AppColours.primaryColor : Colors.black,
            ),
            label: '',
          ),
        ],
      ),

      body: screens[currentIndex],
    );
  }
}
