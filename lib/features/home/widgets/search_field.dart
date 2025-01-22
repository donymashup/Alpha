import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: AppConstant.cardBackground, // Background color
        borderRadius: BorderRadius.circular(30), // Rounded edges
        border: Border.all(color: Colors.grey.shade300), // Border
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search here...", // Placeholder text
          hintStyle: TextStyle(color: AppConstant.hindColor), // Placeholder style
          border: InputBorder.none,
           // Remove default border
          prefixIcon: CustonImageButtom(path: 'assets/icons/search.png',) , // Leading icon
          suffixIcon: CustonImageButtom(path: 'assets/icons/ai.png'),
        ),
        onChanged: (value) {
          // Handle search input changes
        },
      ),
    );
  }
}
