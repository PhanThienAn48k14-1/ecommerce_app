import 'package:ecommerce_app/controllers/productgrid_controller.dart';
import 'package:ecommerce_app/views/widgets/product_card.dart';
import 'package:ecommerce_app/views/widgets/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductGridController>();

    return Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator()) : controller.products.isEmpty
        ? const Center(child: Text('No products available')) :
    GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ),
          ),
          child: ProductCard(product: product),
        );
      },
    )
    );
  }
}