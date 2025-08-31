import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  var favoriteIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favorites') ?? [];
    favoriteIds.assignAll(favoriteList.map((id) => int.parse(id)).toSet());
  }

  Future<void> toggleFavorite(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    if (favoriteIds.contains(productId)) {
      favoriteIds.remove(productId);
    } else {
      favoriteIds.add(productId);
    }
    await prefs.setStringList('favorites', favoriteIds.map((id) => id.toString()).toList());
  }
}