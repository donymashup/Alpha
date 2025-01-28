import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Replace with your app logo
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "About Our App",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "This is a demo About Us page for your Flutter app. Here you can describe your app, "
              "its purpose, and what makes it unique. Provide users with a brief overview of your services "
              "or company background.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Our mission is to provide high-quality mobile and web solutions that enhance user experience "
              "and streamline everyday tasks. We are committed to innovation and customer satisfaction.",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
