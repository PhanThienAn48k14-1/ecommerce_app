import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/address_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

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
          'Checkout',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.home, color: Colors.red),
              title: Text('Home',style: AppTextstyle.withColor(
                AppTextstyle.bodyLarge,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),),
              subtitle: Text('123 Main Street, Apt 4B\nNew York, NY 10001',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodySmall,
                  isDark ? Colors.grey[400] ! : Colors.grey[600]!,
                ),),
              trailing: Icon(Icons.edit, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/200px-Visa_Inc._logo.svg.png',
                width: 40,
                height: 40,
              ),
              title: Text('Visa ending in 4242',style: AppTextstyle.withColor(
                AppTextstyle.bodyLarge,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),),
              subtitle: Text('Expires 12/24',style: AppTextstyle.withColor(
                AppTextstyle.bodySmall,
                isDark ? Colors.grey[400] ! : Colors.grey[600]!,
              ),),
              trailing: Icon(Icons.edit, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Subtotal',style: TextStyle(fontSize: 20),),
              trailing: Text('\$599.93',style: TextStyle(fontSize: 17),),
            ),
            ListTile(
              title: Text('Shipping',style: TextStyle(fontSize: 20),),
              trailing: Text('\$10.00',style: TextStyle(fontSize: 17),),
            ),
            ListTile(
              title: Text('Tax',style: TextStyle(fontSize: 20),),
              trailing: Text('\$53.00',style: TextStyle(fontSize: 17),),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 21),
              ),
              trailing: Text(
                '\$662.10',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red,fontSize: 19),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Place Order (\$662.23)',
                  style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
