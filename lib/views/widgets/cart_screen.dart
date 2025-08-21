import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/check_out_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'My Cart',
          style: AppTextstyle.withColor(
              AppTextstyle.h3,
              isDark ? Colors.white : Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) => _buildCartItem(
                context,
                products[index],
              ),
            ),
          ),
          _buildCartSummery(context),
        ],
      ),
    );
  }
  Widget _buildCartItem(BuildContext context, Product product) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
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
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.asset(
              product.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ), // Image.asset
          ), // ClipRRect
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppTextstyle.withColor(
                            AppTextstyle.bodyLarge,
                            Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red
                      )
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.h3,
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ), // BoxDecoration
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              '1',
                              style: AppTextstyle.withColor(
                                AppTextstyle.bodyLarge,
                                Theme.of(context).primaryColor,
                              ),
                            ), // Text
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
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
  Widget _buildCartSummery(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total (4 items)',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              Text(
                '\$599.00',
                style: AppTextstyle.withColor(
                  AppTextstyle.h2,
                  Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=>CheckOutScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child:  Text(
                  'Proceed to Checkout',
                    style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Colors.white
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
