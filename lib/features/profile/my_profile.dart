import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:alpha/common%20widgets/customappbar.dart';
import 'package:alpha/common%20widgets/drawermenu/drawer.dart';
import 'package:alpha/constants/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image; // Stores the selected image
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the profile picture
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle: "My Profile"),
      drawer: DrawerScreen(),
      backgroundColor: AppConstant.backgroundColor,
      body: SingleChildScrollView(
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
                    child: GestureDetector(
                      onTap: _pickImage, // Tap to change image
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: _image != null
                            ? FileImage(_image!) // Show selected image
                            : AssetImage('assets/images/vkprofile.png') as ImageProvider, // Default profile picture
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Upload Image Button
              ElevatedButton(
                onPressed: _pickImage, // Pick an image
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

              // Editable TextField for Setting New Password
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              const SizedBox(height: 10),

              // Update Password Button
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
    );
  }
}
