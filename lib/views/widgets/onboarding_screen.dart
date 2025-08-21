import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/views/widgets/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController=PageController();
  int _currentPage=0;
  // list các item gồm aảnh, tiêu đề, mô tả cho 3 trang intro
  final List<OnboardingItem> _items=[
    OnboardingItem(
      description: 'Explore the newest fashion trends and find your unique style',
      title: 'Discover Latest Trends',
      image: 'assets/images/intro.png',
    ),
    OnboardingItem(
      description: 'Shop premium quality products from top brands worldwide',
      title: 'Quality Products',
      image: 'assets/images/intro1.png',
    ),
    OnboardingItem(
      description: 'Simple and secure shopping experience at your fingertips',
      title: 'Easy Shopping',
      image: 'assets/images/intro2.png',
    ),
  ];
  // xử lí nút started button pressed
  void _handleGetStarted(){
    final AuthController authController=Get.find<AuthController>();
    authController.setFirstTimeDone();
    Get.off(()=> SigninScreen());

  }


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder( // tạo một danh sách các trang có thể vuốt hiển thị nội dung từ items
              controller: _pageController,
              itemCount: _items.length,
              onPageChanged: (index){
                setState(() {
                  _currentPage=index;
                });
              },
              itemBuilder: (context,index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _items[index].image,
                      height: MediaQuery.of(context).size.height*0.4,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _items[index].title,
                      textAlign: TextAlign.center,
                      style: AppTextstyle.withColor(AppTextstyle.h1, Theme.of(context).textTheme.bodyLarge!.color!),
                    ),
                    const SizedBox(height: 16,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyle.withColor(AppTextstyle.bodyLarge,isDark? Colors.grey[400] ! : Colors.grey[600]!,
                      )
                    ),

                    )
                  ],
                );
              }),

          // đây là thanh màu cam gần dưới trang
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                    (index) => AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Theme.of(context).primaryColor
                        : (isDark ? Colors.grey[700] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),



          //nút skip và get started dưới cùng
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: ()=>_handleGetStarted(), child: Text("Skip",style: AppTextstyle.withColor(AppTextstyle.buttonMedium,
                                                    isDark ? Colors.grey[400] ! : Colors.grey[600]!))
                ),
                ElevatedButton(onPressed: (){
                  if(_currentPage < _items.length - 1){
                    _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }else{
                    _handleGetStarted();
                  }
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  child: Text(
                    _currentPage < _items.length - 1 ? 'Next' : "Get Started",
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white, // Thay đổi màu sắc tùy theo yêu cầu
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingItem{

  final String image;
  final String title;
  final String description;
  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
