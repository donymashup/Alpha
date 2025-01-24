import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  const CourseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            );
  }
}

