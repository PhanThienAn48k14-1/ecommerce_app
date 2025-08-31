import 'package:ecommerce_app/views/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/views/widgets/product_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controllers/theme_controller.dart';
import '../../utils/app_textstyles.dart';
import 'all_products_screen.dart';
import 'cart_screen.dart';
import 'category_chips.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // header section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ), // CircleAvatar
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Phan An",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Good morning",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  // notification icon
                  // IconButton(onPressed: (){},
                  //     icon: const Icon(
                  //         Icons.notifications_outlined
                  //     )
                  // ),
                  // cart button

                  IconButton(onPressed: ()=> Get.to(()=> CartScreen()),
                      icon: const Icon(
                          Icons.shopping_cart_outlined
                      )
                  ),
                  //Theme button
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),

                ],
              ), 
            ),

            // search bar
            const CustomSearchBar(),

            // category chips
            // const CategoryChips(),

            //popular products
             Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Product',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(()=>AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            //product grid

            const Expanded(child: ProductGrid()),
          ],
        ),
      ),
    ); 
  }
}
