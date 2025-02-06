import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/otp_screen.dart';
import 'package:alpha/features/auth/widgets/custom_elavatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// class PhoneNumberVerificationPage extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>(); // Form key to manage validation
//   String? phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.pop(context),
//           ),
//           backgroundColor: AppConstant.backgroundColor, // Use the static backgroundColor
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               color: AppConstant.backgroundColor,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 20),
//                     const Text(
//                       'Phone Number\nVerification',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         height: 1.2,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     const Text(
//                       "We'll need your phone number to send an\nOTP for verification.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey,
//                         height: 1.5,
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     Container(
//                       decoration: BoxDecoration(
//                         // color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 2,
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Form(
//                         key: _formKey,
//                         child: IntlPhoneField(
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                               borderSide: BorderSide.none,
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             hintText: 'Enter phone number',
//                             hintStyle: const TextStyle(color: Colors.grey),
//                           ),
//                           initialCountryCode: 'IN', // Default country code
//                           keyboardType: TextInputType.phone,
//                           onChanged: (phone) {
//                             phoneNumber = phone.completeNumber;
//                             print(phone.completeNumber); // Handle phone number change
//                           },
//                           validator: (phone) {
//                             if (phone == null || phone.number.isEmpty) {
//                               return 'Please enter a phone number';
//                             } else if (phone.number.length < 10 || phone.number.length > 15) {
//                               return 'Enter a valid phone number';
//                             }
//                             return null; // Validation passed
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 56,
//                       child: CustomElavatedButton(text:'Sent OTP' , onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // Navigate to the OTP verification page
//                         Navigator.push(context, 
//                         MaterialPageRoute(builder: (context) => OtpScreen()));
//                             // If the form is valid, proceed
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text('Valid phone number: $phoneNumber')),
//                             );
//                           }
                        
//                       }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Positioned(
//             //   bottom: 0,
//             //   left: 0,
//             //   right: 0,
//             //   child: Container(
//             //     height: 200, // Adjust the height as needed
//             //     decoration: BoxDecoration(
//             //       gradient: AppConstant.redWhiteGradient,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PhoneNumberVerificationPage extends StatefulWidget {
//   @override
//   State<PhoneNumberVerificationPage> createState() => _PhoneNumberVerificationPageState();
// }

// class _PhoneNumberVerificationPageState extends State<PhoneNumberVerificationPage> {
//   final _formKey = GlobalKey<FormState>(); 
//  // Form key to manage validation
//   String? phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: AppConstant.backgroundColor,
//         elevation: 0,
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity, // Ensures proper layout
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Phone Number\nVerification',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     height: 1.2,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "We'll need your phone number to send an\nOTP for verification.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                     height: 1.5,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         spreadRadius: 2,
//                         blurRadius: 4,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: IntlPhoneField(
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'Enter phone number',
//                         hintStyle: const TextStyle(color: Colors.grey),
//                       ),
//                       initialCountryCode: 'IN',
//                       keyboardType: TextInputType.phone,
//                       onChanged: (phone) {
//                         phoneNumber = phone.completeNumber;
//                         print(phone.completeNumber);
//                       },
//                       validator: (phone) {
//                         if (phone == null || phone.number.isEmpty) {
//                           return 'Please enter a phone number';
//                         } else if (phone.number.length < 10 || phone.number.length > 15) {
//                           return 'Enter a valid phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: CustomElavatedButton(
//                     text: 'Send OTP',
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => OtpScreen()),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Valid phone number: $phoneNumber')),
//                         );
//                       }
//                       else {
//                         // Show validation errors
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Please enter a valid phone number')),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class PhoneNumberVerificationPage extends StatefulWidget {
//   @override
//   State<PhoneNumberVerificationPage> createState() => _PhoneNumberVerificationPageState();
// }

// class _PhoneNumberVerificationPageState extends State<PhoneNumberVerificationPage> {
//   final _formKey = GlobalKey<FormState>();
//   String? phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: AppConstant.backgroundColor,
//         elevation: 0,
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Phone Number\nVerification',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     height: 1.2,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "We'll need your phone number to send an\nOTP for verification.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                     height: 1.5,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         spreadRadius: 2,
//                         blurRadius: 4,
//                         offset: const Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     child: IntlPhoneField(
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'Enter phone number',
//                         hintStyle: const TextStyle(color: Colors.grey),
//                       ),
//                       initialCountryCode: 'IN',
//                       keyboardType: TextInputType.phone,
//                       onChanged: (phone) {
//                        setState(() {
//                           phoneNumber = phone.completeNumber;
//                        });
//                       },
//                       validator: (phone) {
//                         if (phone == null || phone.number.isEmpty) {
//                           return 'Please enter a phone number';
//                         } else if (phone.number.length < 10 || phone.number.length > 15) {
//                           return 'Enter a valid phone number';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 56,
//                   child: CustomElavatedButton(
//                     text: 'Send OTP',
//                     onPressed: () {
//                       // Trigger form validation explicitly
//                       if (_formKey.currentState != null && _formKey.currentState!.validate()) {
//                         // Proceed only if validation passes
//                         setState(() {});
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => OtpScreen()),
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Valid phone number: $phoneNumber')),
//                         );
//                       } else {
//                         // Show validation errors
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Please enter a valid phone number')),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/features/auth/screen/otp_screen.dart';
import 'package:alpha/features/auth/widgets/custom_elavatedbutton.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberVerificationPage extends StatefulWidget {
  @override
  State<PhoneNumberVerificationPage> createState() => _PhoneNumberVerificationPageState();
}

class _PhoneNumberVerificationPageState extends State<PhoneNumberVerificationPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppConstant.backgroundColor,
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Phone Number\nVerification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "We'll need your phone number to send an\nOTP for verification.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled, // Disable auto-validation
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter phone number',
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      initialCountryCode: 'IN',
                      keyboardType: TextInputType.phone,
                      onChanged: (phone) {
                        setState(() {
                          phoneNumber = phone.completeNumber;
                        });
                      },
                      validator: (phone) {
                        if (phone == null || phone.number.isEmpty) {
                          return 'Please enter a phone number';
                        } else if (phone.number.length < 10 || phone.number.length > 15) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomElavatedButton(
                    text: 'Send OTP',
                    onPressed: () {
                      // ✅ Call validate() explicitly
                      if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
                        // Show error message if validation fails
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a valid phone number')),
                        );
                        return;
                      }
                      
                      // ✅ If validation passes, proceed to OTP screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpScreen()),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Valid phone number: $phoneNumber')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
