import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:ecommerce_app/views/widgets/custom_nav_bar.dart';
import 'package:ecommerce_app/views/widgets/shopping_screen.dart';
import 'package:ecommerce_app/views/widgets/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/theme_controller.dart';
import 'account_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find<NavigationController>();
    return GetBuilder<ThemeController>( //Getbuilder dùng để rebuild giao diện khi trạng thái themeController thay đổi
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Obx(
                () => IndexedStack( // hiêển thị một trong các widget con  dựa trên chỉ số index
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: const [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar(),// AnimatedSwitcher
      ),
    );
  }
}
