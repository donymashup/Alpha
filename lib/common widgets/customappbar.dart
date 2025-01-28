import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;

  const CustomAppBar({
    required this.appbarTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appbarTitle,
        style: TextStyle(
          color: AppConstant.titlecolor, // Correct constant name
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppConstant.backgroundColor,
      
      // leading: GestureDetector(
      //   onTap: () {
      //     // Navigate to a new screen when the menu icon is tapped
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => DrawerScreen()),
      //     );
      //   },
      //   child: CustonImageButtom(path: 'assets/icons/menu.png'), // Correct class name
      // ),
      actions: [
        IconButton(
          icon: Container(
            decoration: const BoxDecoration(
              color: Colors.white, // Background color of the circle
              shape: BoxShape.circle, // Circular shape
            ),
            
            padding: const EdgeInsets.all(8), // Adjust padding for the icon size
            child: Image.asset(
              'assets/icons/bell.png',
              height: 24,
              width: 24,
            ),
          ),
          onPressed: () {},
        ),
        CustonImageButtom(path: 'assets/icons/profile.png'), // Correct class name
      ],
    );
    
    

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
