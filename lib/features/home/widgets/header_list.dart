import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HeaderList extends StatelessWidget {
  const HeaderList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Set a fixed height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Make the list scroll horizontally
        itemCount: AppConstant.items.length, // Number of items in the list
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding for spacing
            child: GestureDetector(
              onTap: () {
                // Add your onTap action here
              },
              child: Card(
                elevation: 4, // Shadow effect for the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), // Rounded corners
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                    color: AppConstant.primaryColor, // Card color
                  ),
                  child: Center(
                    child: Text(
                      AppConstant.items[index], // Display item name
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}