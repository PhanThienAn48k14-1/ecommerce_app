import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/main_screen.dart';
import 'package:ecommerce_app/views/widgets/onboarding_screen.dart';
import 'package:ecommerce_app/views/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});

  final AuthController authController=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    //Navigate based on the auth state
    Future.delayed(const Duration(milliseconds: 2500),(){
      // if(authController.isFirstTime){
      //   Get.off(()=> const OnboardingScreen());
      // }else if(authController.isLoggedIn){
      //   Get.off(()=> const MainScreen());
      // }else{
      //   Get.off(()=> SigninScreen());
      // }
      Get.off(()=>OnboardingScreen());

    });

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(// cái này giúp tạo hiệu ứng màu mờ dần từ topleft xuống bottomright
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:[ //đây là thứ tự màu sẽ mờ dần
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.8),
                  Theme.of(context).primaryColor.withOpacity(0.6),
                ]
            )
          ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Logo.webp',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Fashion Store",style: AppTextstyle.h1),
              ],
            )
          ),
        )
      ),
    );
  }
}


