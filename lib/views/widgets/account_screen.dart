import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/my_orders_screen.dart';
import 'package:ecommerce_app/views/widgets/onboarding_screen.dart';
import 'package:ecommerce_app/views/widgets/shipping_address_screen.dart';
import 'package:ecommerce_app/views/widgets/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(context),
            const SizedBox(height: 24),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }
  Widget _buildProfileSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[850] : Colors.grey[100],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/an.jpg'),
          ),
          const SizedBox(height: 16),
          Text(
            'Phan An',
            style: AppTextstyle.withColor(
              AppTextstyle.h2,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'anphan1908204@gmail.com',
            style: AppTextstyle.withColor(
              AppTextstyle.bodyMedium,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              'Edit Profile',
              style: AppTextstyle.withColor(
                AppTextstyle.buttonMedium,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final menuItems = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'My Orders'},
      {'icon': Icons.location_on_outlined, 'title': 'Shipping Address'},
      {'icon': Icons.logout_outlined, 'title': 'Logout'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: menuItems.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
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
            child: ListTile(
              leading: Icon(
                item['icon'] as IconData,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                item['title'] as String,
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
              onTap: () {
                if (item['title'] == 'Logout') {
                  Get.to(()=>SigninScreen());
                } else if (item['title'] == 'My Orders') {
                  Get.to(()=>MyOrdersScreen());
                } else if (item['title'] == 'Shipping Address') {
                  Get.to(()=>ShippingAddressScreen());
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
