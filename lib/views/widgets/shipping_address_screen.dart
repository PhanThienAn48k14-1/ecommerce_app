import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/address_card.dart';
import 'package:ecommerce_app/views/widgets/address_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ShippingAddressScreen extends StatelessWidget {
  final AddressRepository _repository = AddressRepository();
  ShippingAddressScreen({super.key});

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
          'Shipping Address',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context);
            },
            icon: Icon(
              Icons.add_circle_outline,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _repository.getAddresses().length,
        itemBuilder: (context, index) => _buildAddressCard(context, index),
      ),
    );
  }
  Widget _buildAddressCard(BuildContext context, int index) {
    final address = _repository.getAddresses()[index];
    return AddressCard(
      address: address,
    );
  }
  void showDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        content: Text(
          'Add new address',
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
