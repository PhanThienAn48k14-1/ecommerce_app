import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../controllers/favorite_controller.dart';
import 'cart_screen.dart';
import 'product_card.dart'; // Import để sử dụng FavoriteController

class WishlistController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        products.assignAll(jsonList.map((json) => Product.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading(false);
    }
  }
}

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final wishlistController = Get.put(WishlistController());
    final favoriteController = Get.find<FavoriteController>();


    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: AppTextstyle.withColor(
              AppTextstyle.h3, isDark ? Colors.white : Colors.black),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.search,
        //       color: isDark ? Colors.white : Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: Obx(() => CustomScrollView(
        slivers: [
          // summary section
          SliverToBoxAdapter(
            child: _buildSummarySection(context, favoriteController.favoriteIds),
          ),
          // wishlist items
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: wishlistController.isLoading.value
                ? const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            )
                : favoriteController.favoriteIds.isEmpty
                ? const SliverToBoxAdapter(
              child: Center(child: Text('No items in wishlist')),
            )
                : SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final favoriteProducts = wishlistController.products
                      .where((p) => favoriteController.favoriteIds.contains(p.id))
                      .toList();
                  return _buildWishlistItem(context, favoriteProducts[index]);
                },
                childCount: favoriteController.favoriteIds.length,
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildSummarySection(BuildContext context, Set<int> favoriteIds) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${favoriteIds.length} Items',
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
            onPressed: () {
              final wishlistController = Get.find<WishlistController>();
              final favoriteController = Get.find<FavoriteController>();
              final favoriteProducts = wishlistController.products
                  .where((p) => favoriteController.favoriteIds.contains(p.id))
                  .toList();
              for (var product in favoriteProducts) {
                Get.find<CartController>().addToCart(product);
              }
              Get.to(() => CartScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
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
    final favoriteController = Get.find<FavoriteController>();

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
            child: Image.network(
              product.images.isNotEmpty ? product.images[0] : 'https://placehold.co/600x400',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.network(
                'https://placehold.co/600x400',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyLarge,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.category.name,
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
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.h2,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.find<CartController>().addToCart(product);
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              favoriteController.toggleFavorite(product.id);
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
                  ),
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
          'Item removed from wishlist',
          style: AppTextstyle.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'OK',
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}