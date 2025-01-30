import 'package:alpha/common%20widgets/drawermenu/aboutus.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppConstant.cardBackground, // Set background color for the entire drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header with logo
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppConstant.cardBackground, // Match background color
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/alphalogo.png', // Replace with your logo image path
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            // List of menu options in the drawer
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: () {
                // Navigate to About Us page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text('Terms And Conditions'),
              onTap: () {
                // Navigate to Terms and Conditions page
                Navigator.pushNamed(context, '/terms_conditions');
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('Privacy Policy'),
              onTap: () {
                // Navigate to Privacy Policy page
                Navigator.pushNamed(context, '/privacy_policy');
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Customer Support'),
              onTap: () {
                // Navigate to Customer Support page
                Navigator.pushNamed(context, '/customer_support');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete_forever),
              title: const Text('Delete Account'),
              onTap: () {
                // Perform delete account action
                Navigator.pushNamed(context, '/delete_account');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Perform logout action
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
