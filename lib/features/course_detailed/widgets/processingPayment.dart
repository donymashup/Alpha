import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProcessingPayment extends StatelessWidget {
  const ProcessingPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/images/processingpayment.json',
        fit: BoxFit.fill,
      ),
    );
  }
}
