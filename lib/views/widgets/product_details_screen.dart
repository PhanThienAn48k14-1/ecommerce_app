import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/widgets/cart_screen.dart';
import 'package:ecommerce_app/views/widgets/check_out_screen.dart';
import 'package:ecommerce_app/views/widgets/size_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_textstyles.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          'Details',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ), // Text
        ),
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  // image
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              //product detail
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: AppTextstyle.withColor(
                              AppTextstyle.h2,
                              Theme.of(context).textTheme.headlineMedium!.color!,
                            ),
                          ),
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: AppTextstyle.withColor(
                            AppTextstyle.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      product.category,
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyMedium,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ), // Text
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Select Size',
                      style: AppTextstyle.withColor(
                        AppTextstyle.labelMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // size selector
                    const SizeSelector(),

                    SizedBox(height: screenHeight * 0.02),

                    Text(
                      'Description',
                      style: AppTextstyle.withColor(
                        AppTextstyle.labelMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ), // Text
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      product.description,
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodySmall,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      //button add to cart
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Get.to(()=>CartScreen()),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),
                  child: Text(
                      'Add To Cart',
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),

              // Expanded(
              //   child: OutlinedButton(
              //     onPressed: () => Get.to(()=>CheckOutScreen()),
              //     style: OutlinedButton.styleFrom(
              //       padding: EdgeInsets.symmetric(
              //         vertical: screenHeight * 0.02,
              //       ),
              //       side: BorderSide(
              //         color: isDark ? Colors.white70 : Colors.black12,
              //       ),
              //     ),
              //     child: Text(
              //       'Buy Now',
              //       style: AppTextstyle.withColor(
              //         AppTextstyle.buttonMedium,
              //         Theme.of(context).textTheme.bodyLarge!.color!,
              //       ),
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),

    );
  }
}
