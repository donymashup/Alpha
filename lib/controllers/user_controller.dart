import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var username = 'User'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUsername();
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('firstName') ?? 'User';
  }
}
