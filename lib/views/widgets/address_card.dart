import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/address.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  const AddressCard({
    super.key,
    required this.address,
});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),

                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            address.label,
                            style: AppTextstyle.withColor(
                              AppTextstyle.h3,
                              Theme.of(context).textTheme.bodyLarge!.color!,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${address.fullAddress}\n${address.city}, ${address.state} ${address.zipCode}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.bodyMedium,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    showEditDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Edit',
                          style: AppTextstyle.withColor(
                            AppTextstyle.buttonMedium,
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 24,
                width: 1,
                color: Colors.grey.shade200,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showDeleteDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Delete',
                          style: AppTextstyle.withColor(
                            AppTextstyle.buttonMedium,
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
  void showEditDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        content: Text(
          'Edit address',
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
  void showDeleteDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        content: Text(
          'Delete address',
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
