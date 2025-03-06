import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessfull extends StatelessWidget {
  const PaymentSuccessfull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/images/paymentsuccess.json',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomBottomNavigation(),
              ),
            );
          },
          child: const Text("Home Page"),
        )
      ],
    );
  }
}
