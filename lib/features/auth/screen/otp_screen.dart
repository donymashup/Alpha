import 'package:alpha/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();
  String? _otpCode;

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
       //border: Border.all(color: Colors.grey),
       color: Colors.white,
        borderRadius: BorderRadius.circular(30),
         boxShadow: const [
           BoxShadow(
            color: Color.fromARGB(255, 202, 188, 188), // Shadow color
            blurRadius: 4, // Blur radius
            spreadRadius: 2, // Spread radius
            offset: Offset(-2, 3),  // Offset of the shadow
          ),
        ],

      ),
    
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey.shade300,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // title: const Text('OTP Verification'),
        // centerTitle: true,
        // backgroundColor: AppConstant.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Phone Number Authentication',
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'An OTP has send to your Phone Number',
                style: TextStyle(fontSize: 15, color: AppConstant.strokeColor),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Pinput(
              length: 6, // Length of OTP
              controller: _otpController,
              focusNode: _otpFocusNode,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Enter a valid OTP';
                }
                return null;
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              onCompleted: (pin) {
                setState(() {
                  _otpCode = pin;
                });
                // You can handle OTP submission here
                print('OTP Entered: $pin');
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_otpCode != null && _otpCode!.length == 6) {
                  // Handle OTP verification here
                  print('Verifying OTP: $_otpCode');
                } else {
                  // Show error if OTP is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid OTP')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity * .5, 50),
                backgroundColor: AppConstant.primaryColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Verify OTP' ,style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
