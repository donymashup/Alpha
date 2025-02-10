import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/constants/app_constants.dart';
import 'package:alpha/common%20widgets/bottom_navigation_bar.dart';
import 'package:alpha/features/auth/widgets/custom_button.dart'; // Correct import statement
import 'package:alpha/features/auth/widgets/custom_textfield.dart';
import 'package:alpha/features/auth/widgets/profile.dart';
import 'package:alpha/features/auth/widgets/wave_widget.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'class 5';   

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController classController = TextEditingController();
final TextEditingController schoolController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

 var items = [    
     'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
    'Class 11',
    'Class 12',
  ];

void submitForm() {
  if (_formKey.currentState!.validate()) {
    print("Form Submitted Successfully!");
    Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => CustomBottomNavigation()),
                           );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: wave_widget(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                wave_widget(
                  height: MediaQuery.of(context).size.height * 0.325,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0,
                  right: 0,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Center(
                      child: Text(
                        'WE WOULD LIKE TO KNOW MORE ABOUT YOU',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppConstant.cardBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                profile(),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(labelText: "First Name", hintText: "Enter your first name",Controller: firstNameController,),
                    const SizedBox(height: 17),
                    CustomTextField(labelText: "Last Name", hintText: "Enter your last name",Controller: lastNameController,),
                    const SizedBox(height: 17),
                    CustomTextField(labelText: "Email id", hintText: "Enter your email id",Controller: emailController,),
                    const SizedBox(height: 17),
                    CustomTextField(labelText: "Password", hintText: "Enter your password", isPassword: true,Controller: passwordController,),
                    const SizedBox(height: 17),
  
                    DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25), 
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: const Color.fromARGB(255, 120, 120, 120)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true, // Ensures dropdown follows parent width
                          items: items.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16), // Adds padding inside the menu
                                child: Text(item),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                          value: dropdownvalue, // Ensure `dropdownvalue` is initialized
                        ),
                      ),
                    ),

                    const SizedBox(height: 17),
                    CustomTextField(labelText: "School Name", hintText: "Enter your school name",Controller:schoolController ,),
                    const SizedBox(height: 17),
                    CustomTextField(labelText: "Phone Number", hintText: "",Controller: phoneController,),
                    const SizedBox(height: 30),
                    Center(
                      child: CustomButton(
                        onPressed:  () {
                          submitForm();                         
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}