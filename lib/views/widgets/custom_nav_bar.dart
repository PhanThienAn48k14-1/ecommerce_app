import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find<NavigationController>();
    return Obx(
          () => BottomNavigationBar(
        currentIndex: navigationController.currentIndex.value,
        onTap: (index) => navigationController.changeIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), // Ví dụ icon khác
            label: 'Shopping', // Ví dụ label khác
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), // Ví dụ icon khác
            label: 'Wishlist', // Ví dụ label khác
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), // Ví dụ icon khác
            label: 'Account', // Ví dụ label khác
          ),
        ],
      ),
    );
  }
}
