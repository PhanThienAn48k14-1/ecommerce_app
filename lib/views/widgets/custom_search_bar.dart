import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/productgrid_controller.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController searchController = TextEditingController();
    final  productGridController = Get.find<ProductGridController>();
    final RxList<Product> searchResults = <Product>[].obs;

    void performSearch(String query) {
      if (query.isEmpty) {
        searchResults.clear();
      } else {
        searchResults.assignAll(
          productGridController.products.where(
                (product) => product.title.toLowerCase().contains(query.toLowerCase()),
          ).toList(),
        );
      }
    } // bộ lọc kiểm tra tìm kiếm

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: searchController,
            style: AppTextstyle.withColor(
              AppTextstyle.buttonMedium,
              Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
            ),
            decoration: InputDecoration(
              hintText: 'Search products',
              hintStyle: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
              filled: true,
              fillColor: isDark ? Colors.grey[800] : Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  width: 1,
                ),
              ),
            ),
            onChanged: (value) => performSearch(value),
          ),
        ),
        Obx(() => searchResults.isEmpty && searchController.text.isNotEmpty
            ? const Padding(
          padding: EdgeInsets.all(16),
          child: Text('No products found'),
        )
            : searchResults.isEmpty
            ? const SizedBox.shrink()
            : Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final product = searchResults[index];
              return ListTile(
                leading: Image.network(
                  product.images.isNotEmpty
                      ? product.images[0]
                      : 'https://placehold.co/600x400',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.network(
                        'https://placehold.co/600x400',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                ),
                title: Text(
                  product.title,
                  style: AppTextstyle.withColor(
                    AppTextstyle.bodyLarge,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                subtitle: Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextstyle.withColor(
                    AppTextstyle.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                ),
                onTap: () {
                  Get.to(() => ProductDetailsScreen(product: product));
                },
              );
            },
          ),
        )),
      ],
    );
  }
}