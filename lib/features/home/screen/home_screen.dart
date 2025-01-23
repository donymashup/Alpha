
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/home/widgets/carousel.dart';
import 'package:alpha/features/home/widgets/custom_Image_Button.dart';
import 'package:alpha/features/home/widgets/header_list.dart';
import 'package:alpha/features/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar:   AppBar(
      title: const Text(
        'Hello, Dora',
        style: TextStyle(
          color: AppConstant.titlecolor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          
        ),
      ),
      backgroundColor: AppConstant.backgroundColor,
      leading: CustonImageButtom(path:'assets/icons/menu.png'),
      actions: [
        IconButton(
        icon: Container(
          decoration:const BoxDecoration(
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
        onPressed: () {
          // Add your notification functionality here
        },
        ),

        CustonImageButtom(path:'assets/icons/profile.png'),
      ],
    ),
     body: SingleChildScrollView(
       child: Container(
         child:  Padding(
           padding: const EdgeInsets.all(10.0),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                const Row(
                  children: [
                     Text(
                      "Let's Learn",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        color: AppConstant.primaryColor
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image(
                      image: AssetImage('assets/icons/cap.png'), // Correct way to use an asset image
                      height: 50, // Adjust the height of the icon
                      width: 50, // Adjust the width of the icon
                    ),
                  ],
                ),
                //const SizedBox(height: 20),
                const Text(
                  'Something new',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppConstant.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10),
                const SearchField(),
                const SizedBox(height: 20),
                const CarouselImage(),
                const SizedBox(height: 20),
                  SizedBox(
                  height: 30, // Adjust this value based on how tall you want the list
                child: const HeaderList(),
              ),
               const SizedBox(height: 20),
               ListView.builder(
                shrinkWrap: true, // Prevents the list from taking up the entire screen
            physics: NeverScrollableScrollPhysics(),
          itemCount: AppConstant.item.length,
          itemBuilder: (context, index) {
            final item = AppConstant.item[index];
            return Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
             ),
             color: AppConstant.cardBackground,
              elevation: 5,
              child: Row(
                children: [
                  // Image section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                      ),
                      child: Image.asset(
                        item["imagePath"],
                        width: 200,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Text and rating section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${item["rating"]}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      
              ],
           ),
         )
       ),
     ),
    );
  }
}

