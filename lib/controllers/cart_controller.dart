import 'package:ecommerce_app/models/product.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  var cartItems = <Product, int>{}.obs; // Map to store products and their quantities

  // Add product to cart
  void addToCart(Product product, {int quantity = 1}) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + quantity;
    } else {
      cartItems[product] = quantity;
    }
    Get.snackbar('Success', '${product.title} added to cart');
  }

  // Remove product from cart
  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar('Removed', '${product.title} removed from cart');
  }

  // Update quantity of a product in cart
  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      removeFromCart(product);
    } else {
      cartItems[product] = quantity;
    }
  }

  // Calculate total price
  double get totalPrice => cartItems.entries.fold(
    0.0,
        (sum, entry) => sum + entry.key.price * entry.value,
  );

  // Calculate total items
  int get totalItems => cartItems.entries.fold(
    0,
        (sum, entry) => sum + entry.value,
  );
}