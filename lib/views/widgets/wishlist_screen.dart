import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: AppTextstyle.withColor(
              AppTextstyle.h3,
              isDark ? Colors.white : Colors.black),
        ), // Text
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
      body: CustomScrollView(
        slivers: [
          //sumary section
          SliverToBoxAdapter(
            child: _buildSummarySection(context),
          ),

          //wishlistitem
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildWishlistItem(
                  context,
                  products.where((p) => p.isFavorite).toList()[index],
                ),
                childCount: products.where((p) => p.isFavorite).length,
              ), // SliverChildBuilderDelegate // SliverList
            ), // SliverPadding
          )
        ],
      ),
    );
  }
  Widget _buildSummarySection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final favoriteProducts = products.where((p)=>p.isFavorite).length;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ), // BorderRadius.vertical
      ), // BoxDecoration
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$favoriteProducts Items',
                style: AppTextstyle.withColor(
                  AppTextstyle.h2,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'in your wishlist',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed:  () => Get.to(()=> CartScreen()),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              )
            ),
            child: Text(
              'Add All to Cart',
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildWishlistItem(BuildContext context, Product product) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // product image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(
              product.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyLarge,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.category,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodySmall,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  const SizedBox(height: 8),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                           '\$${product.price}',
                           style: AppTextstyle.withColor(
                             AppTextstyle.h2,
                             Theme.of(context).textTheme.bodyLarge!.color!,)
                       ),
                       Row(
                         children: [
                           IconButton(
                             onPressed: () => Get.to(()=> CartScreen()),
                             icon: Icon(
                               Icons.shopping_cart_outlined,
                               color: Theme.of(context).primaryColor,
                             ),
                           ),
                           IconButton(
                             onPressed: () {
                               showDeleteDialog(context);
                             },
                             icon: Icon(
                               Icons.delete_outline,
                               color: isDark ? Colors.grey[400] : Colors.grey[600],
                             ),
                           ),
                         ],
                       ),
                     ],
                   )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showDeleteDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        content: Text(
          'Delete item',
          style: AppTextstyle.bodyMedium,
        ), // Text
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK',
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).primaryColor,
              ),),
          ),
        ],
      ),
    );
  }
}
