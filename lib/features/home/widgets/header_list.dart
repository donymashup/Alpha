import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HeaderList extends StatelessWidget {
  const HeaderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
                scrollDirection: Axis.horizontal, // Make the list scroll horizontally
                itemCount: AppConstant.items.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 5, // Shadow effect for the card
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                      ),
                      child: Container(
                        width: 70, // Width of each card
                       height:30, // Height of each card
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstant.primaryColor, // Card color
                        ),
                        child: Center(
                          child: Text(
                            AppConstant.items[index], // Display item name
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 15,
                            color: AppConstant.cardBackground),
                            
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

