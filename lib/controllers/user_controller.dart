import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var username = 'User'.obs;
 // var profileImage = ''.obs; // Observable variable for profile image
  var profilePictureUrl = ''.obs;
  

  // Method to update the profile picture URL
  void updateProfilePicture(String newUrl) async {
    profilePictureUrl.value = newUrl;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('image', newUrl);
  }

  @override
  void onInit() {
    super.onInit();
    loadUsername();
    loadProfilePicture();
    //uploadImage();
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('firstName') ?? 'User';
  }
 // Load profile picture from SharedPreferences
  Future<void> loadProfilePicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUrl = prefs.getString('image');
    if (savedUrl != null) {
      profilePictureUrl.value = savedUrl;
    }
  }
  // Future<void> uploadImage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   profileImage.value = prefs.getString('image') ?? 'default_profile_image_url'; // Set profile image URL
  //   // Proceed with upload image logic (if any)
  // }
}
