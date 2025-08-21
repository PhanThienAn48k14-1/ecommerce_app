import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/custom_textfield.dart';
import 'package:ecommerce_app/views/widgets/forgot_password.dart';
import 'package:ecommerce_app/views/widgets/main_screen.dart';
import 'package:ecommerce_app/views/widgets/onboarding_screen.dart';
import 'package:ecommerce_app/views/widgets/signin_screen.dart';
import 'package:ecommerce_app/views/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const SizedBox(height: 40),
              Text('Welcome Back!',
                style: AppTextstyle.withColor(AppTextstyle.h1,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                )
              ),
              const SizedBox(height: 8,),
              Text("Sign in to continue shopping",
                style: AppTextstyle.withColor(AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400] ! : Colors.grey[600]!,) // nếu isdark là true thì lấy màu grey[400] ! và ngược lại
              ),
              const SizedBox(height: 40,),

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
              const SizedBox(height: 16,),
              // Password textfield
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
              const SizedBox(height: 8,),

              //forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.to(()=> ForgotPasswordScreen()),
                  child: Text(
                    'Forgot Password?',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              //sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24,),

              //Sign up button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: Text('Sign Up',
                      style: AppTextstyle.withColor(
                        AppTextstyle.bodyMedium,
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
  // Sign in button onpressed
  void _handleSignIn() {
    final AuthController authController=Get.find<AuthController>();
    authController.login();
    Get.offAll(()=> MainScreen());
  }
}
