import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ), // BoxConstraints
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
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //favorite button
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[400] : Colors.grey),
                  ), // Icon
                  onPressed: () {},
                ),
              ),
              // if (product.oldPrice != null)
              //   Positioned(
              //     left: 8,
              //     top: 8,
              //     child: Container(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 8,
              //         vertical: 4,
              //       ), // EdgeInsets.symmetric
              //       decoration: BoxDecoration(
              //         color: Theme.of(context).primaryColor,
              //         borderRadius: BorderRadius.circular(4),
              //       ), // BoxDecoration
              //       // discount text
              //       child: Text(
              //         '',
              //         style: AppTextstyle.withColor(
              //           AppTextstyle.withWeight(
              //             AppTextstyle.bodySmall,
              //             FontWeight.bold,
              //           ),
              //           Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
            ],
          ),

          // ten san pham gia ca
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              children: [
                Text(
                  product.name,
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
                  product.category,
                  style: AppTextstyle.withColor(
                    AppTextstyle.bodyMedium,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ), // Text
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
          )
        ],
      ),

    );
  }
}
