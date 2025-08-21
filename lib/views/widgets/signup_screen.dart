import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'custom_textfield.dart';
import 'main_screen.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
   final TextEditingController _nameController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _confirmpasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back button
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black, // Thay đổi màu sắc tùy theo yêu cầu
                ),
              ),

              const SizedBox(height: 20,),

              Text(
                'Create Account',
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                'Sign up to started',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),

              const SizedBox(height: 40),

              //full name textfield

              CustomTextfield(
                label: 'Full name',
                prefixIcon: Icons.person_outlined,
                keyboardType: TextInputType.name,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              //email textfield
              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              //password textfield
              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outlined,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller:_passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),


              //confirm password textfield
              CustomTextfield(
                label: 'Confirm Password',
                prefixIcon: Icons.lock_outlined,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller:_confirmpasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }if(value != _passwordController.text){
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              //sign up button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const MainScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              //Sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ), // Text
                  TextButton(
                    onPressed: () => Get.off(() => SigninScreen()),
                    child: Text(
                      'Sign In',
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
