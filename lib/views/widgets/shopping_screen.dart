import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/product_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_chips.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Shopping',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: CategoryChips(),
          ),
          Expanded(
            child: ProductGrid(),
          ),
        ],
      ),
    );
  }
}
