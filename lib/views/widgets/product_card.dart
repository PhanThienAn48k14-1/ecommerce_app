import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/favorite_controller.dart';
import '../../models/product.dart';



class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final favoriteController = Get.find<FavoriteController>();

    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // image
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.images.isNotEmpty ? product.images[0] : 'https://placehold.co/600x400',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.network(
                      'https://placehold.co/600x400',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // favorite button
              Positioned(
                right: 8,
                top: 8,
                child: Obx(() => IconButton(
                  icon: Icon(
                    favoriteController.favoriteIds.contains(product.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoriteController.favoriteIds.contains(product.id)
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[400] : Colors.grey),
                  ),
                  onPressed: () {
                    favoriteController.toggleFavorite(product.id);
                  },
                )),
              ),
            ],
          ),
          // product title and category
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              children: [
                Text(
                  product.title,
                  style: AppTextstyle.withColor(
                    AppTextstyle.withWeight(
                      AppTextstyle.h3,
                      FontWeight.bold,
                    ),
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  product.category.name,
                  style: AppTextstyle.withColor(
                    AppTextstyle.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextstyle.withColor(
                        AppTextstyle.withWeight(
                          AppTextstyle.bodyLarge,
                          FontWeight.bold,
                        ),
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}