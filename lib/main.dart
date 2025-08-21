import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:ecommerce_app/controllers/theme_controller.dart';
import 'package:ecommerce_app/utils/app_themes.dart';
import 'package:ecommerce_app/views/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

void main() async{// sử dụng bất đồng bộ để đợi GetStorage được khởi tạo ròi sau đó mới chạy các code tiếp theo vì các controller có storage trong đó
  await GetStorage.init(); //khoiwri tạo GetStorage cho toàn bộ controller
  Get.put(ThemeController());// đăng ký các controller để sử dụng cho toàn bọ ưứng dụng, được dùng bằng cách sử dụng Get.find
  Get.put(AuthController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController=Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion store',
      showSemanticsDebugger: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: Splashscreen(),
    );
  }
}


