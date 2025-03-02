import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/controllers/is_subscribed_controller.dart';
import 'package:alpha/models/course_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewTab extends StatelessWidget {
  final CourseDetailsModel courseDetailsModel;

  ReviewTab({super.key, required this.courseDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: AppConstant.cardBackground,
        child: Expanded(
          child: SingleChildScrollView(
            child: _ReviewList(reviews: courseDetailsModel.reviews!),
          ),
        ),
      ),
    );
  }
}

class _OverallRatingSection extends StatelessWidget {
  const _OverallRatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '4.5',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          RatingBarIndicator(
            rating: 4.5,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 24.0,
          ),
          const Text(
            '1,245 reviews',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _ReviewList extends StatelessWidget {
  final List<Review> reviews;

  const _ReviewList({Key? key, required this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // Prevent scrolling inside ListView
      shrinkWrap: true, // Shrink ListView to fit its contents
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ListTile(
          // leading: CircleAvatar(
          //   child: Text(review.image!),
          // ),
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(review.image!),
            backgroundColor: Colors.transparent,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(review.name!),
              RatingBarIndicator(
                rating: double.parse(review.rating!),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 16.0,
              ),
            ],
          ),
          subtitle: Text(review.review!),
        );
      },
    );
  }
}

class _SwipeableAddReviewSection extends StatelessWidget {
  const _SwipeableAddReviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! < -10) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            builder: (context) => const _AddReviewSheet(),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.grey[200],
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.keyboard_arrow_up, size: 24, color: Colors.black54),
              Text(
                'Swipe up to add review',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddReviewSheet extends StatefulWidget {
  const _AddReviewSheet({Key? key}) : super(key: key);

  @override
  State<_AddReviewSheet> createState() => _AddReviewSheetState();
}

class _AddReviewSheetState extends State<_AddReviewSheet> {
  double _rating = 3.0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstant.cardBackground,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.0,
          right: 16.0,
          top: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Your Review',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 24,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your review here...',
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                  print('Rating: $_rating');
                  print('Review: ${_reviewController.text}');
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
