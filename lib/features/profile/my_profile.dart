import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:flutter/material.dart';
import 'package:alpha/constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: "My Profile"),
      drawer: DrawerScreen(),
      backgroundColor: AppConstant.backgroundColor,
      body: Container(
        color: AppConstant.backgroundColor, // Set the background color here
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: AppConstant.cardBackground,
                      shadowColor: AppConstant.shadowColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 120,
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ListTile(
                              leading: Icon(Icons.person, color: AppConstant.primaryColor),
                              title: Text('Virat Kohli'),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone, color: AppConstant.primaryColor),
                              title: Text('+91 8078559319'),
                            ),
                            ListTile(
                              leading: Icon(Icons.email, color: AppConstant.primaryColor),
                              title: Text('ishaanwer@gmail.com'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -60,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/vkprofile.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstant.primaryColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Upload A Profile Picture',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 40),

                // Editable TextField for Set New Password
                TextField(
                  obscureText: true, // To hide password input
                  decoration: InputDecoration(
                    labelText: 'Set New Password For Web Portal',
                    labelStyle: TextStyle(color: AppConstant.titlecolor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppConstant.strokeColor),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppConstant.primaryColor2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20), // Correct padding here
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstant.buttonupdate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Update Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
