// 
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var username = 'User'.obs;
  var profilePictureUrl = RxnString(); // Allow null values

  @override
  void onInit() {
    super.onInit();
    loadUsername();
    loadProfilePicture();
  }

  /// Loads the username from SharedPreferences
  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('firstName') ?? 'User';
  }

  /// Loads the profile picture from SharedPreferences
  Future<void> loadProfilePicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUrl = prefs.getString('image');
    if (savedUrl != null) {
      profilePictureUrl.value = savedUrl;
    }
  }

  /// Updates the profile picture URL and stores it in SharedPreferences
  Future<void> updateProfilePicture(String newUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('image', newUrl);

    profilePictureUrl.value = newUrl;  // Update state
    update(); // Force UI update (alternative: profilePictureUrl.refresh())
  }
}
