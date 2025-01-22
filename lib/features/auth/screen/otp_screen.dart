import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/widgets/custom_elavatedbutton.dart';
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
        color: AppConstant.titlecolor,
      ),
      decoration: BoxDecoration(
       //border: Border.all(color: Colors.grey),
       color: AppConstant.cardBackground,
        borderRadius: BorderRadius.circular(30),
         boxShadow: const [
           BoxShadow(
            color:AppConstant.shadowColor, // Shadow color
            blurRadius: 4, // Blur radius
            spreadRadius: 2, // Spread radius
            offset: Offset(-2, 3),  // Offset of the shadow
          ),
        ],

      ),
    
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppConstant.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        //color: Colors.grey.shade300,
      ),
    );

    return Scaffold(
  appBar: AppBar(
    backgroundColor: AppConstant.backgroundColor,
  ),
  body: Stack(
    children: [
      // Background gradient at the bottom
      // Positioned(
      //   bottom: 0,
      //   left: 0,
      //   right: 0,
      //   child: Container(
      //     height: 200, // Adjust the height as needed
      //     decoration: BoxDecoration(
      //       gradient: AppConstant.redWhiteGradient,
      //     ),
      //   ),
      // ),
      // Main content
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppConstant.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Phone Number\nAuthentication',
                    style: TextStyle(fontSize: 27, color: AppConstant.titlecolor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'An OTP has been sent to your Phone Number',
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
                    print('OTP Entered: $pin');
                  },
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomElavatedButton(
                    text: 'Verify OTP',
                    onPressed: () {
                      if (_otpCode != null && _otpCode!.length == 6) {
                        print('Verifying OTP: $_otpCode');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a valid OTP')),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Didn\'t receive the OTP?',
                    style: TextStyle(fontSize: 15, color: AppConstant.strokeColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 15, color: AppConstant.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  ),
);

  }
}
