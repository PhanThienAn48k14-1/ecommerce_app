import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;

class ProductGridController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() { // hàm này là bắt buộc vì đây là một phương thức của lớp GetxController trong GetX, được gọi tự động khi một controller được khởi tạo
    fetchProducts(); // ví dụ là khi khởi tạo đối tượng của controller này thì nó sẽ chạy hàm onInit sau đó những hàm bên trong này
    super.onInit();//này thì có nghĩa là kế thừa từ lớp cha
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products')); //khi lấy dữ liệu từ API sẽ gồm 2 phần là statuscode và body, body là chứa các list sản phẩm
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        products.assignAll(jsonList.map((json) => Product.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading(false);
    }
  }
}