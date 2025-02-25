import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/user_controller.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:alpha/features/notification/screen/notifications.dart';
import 'package:alpha/features/profile/screen/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;
  final UserController userController;

  CustomAppBar({
    required this.appbarTitle,
    super.key,
  }) : userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appbarTitle,
        style: TextStyle(
          color: AppConstant.titlecolor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppConstant.backgroundColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0), // Add padding to the right
          child: IconButton(
            icon: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/icons/bell.png',
                height: 24,
                width: 24,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0), // Added padding for better spacing
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Obx(() {
              return userController.profilePictureUrl.value != null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userController.profilePictureUrl.value!),
                    )
                  : CustonImageButtom(path: 'assets/icons/profile.png');
            }),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
