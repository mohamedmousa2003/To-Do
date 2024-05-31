import 'package:flutter/material.dart';
import 'package:todo/core/app_color.dart';

import '../../widget/tap_text.dart';

class Register extends StatelessWidget {
  Register({super.key});

  static String routeName = "register";
  var full_Name_Controller = TextEditingController();
  var password_Controller = TextEditingController();
  var confirmation_Password_Controller = TextEditingController();
  var email_Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_login.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
              top: mediaQuery.height * 0.1,
              left: mediaQuery.width * 0.42,
              child: Text(
                "Login",
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              )),
          Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: full_Name_Controller,
                          hint: "Full Name",
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your full name";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: email_Controller,
                          hint: "Email",
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your email";
                            }
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                                .hasMatch(text);
                            if (!emailValid) {
                              return "Please enter valid email content @[a-zA-Z0-9]";
                            }
                            return null;
                          },
                          keyboardType: TextInputType
                              .emailAddress, // as to show @ in keyboard
                        ),
                        CustomTextField(
                          controller: password_Controller,
                          hint: "Password",
                          isPassword: true,
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your password";
                            }
                            if (text.length < 6) {
                              return "please enter password not less 6 char";
                            }
                            return null;
                          },
                          keyboardType: TextInputType
                              .emailAddress, // as to show @ in keyboard
                        ),
                        CustomTextField(
                          controller: confirmation_Password_Controller,
                          isPassword: true,
                          hint: "Confirm Password",
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your confirm Password";
                            }
                            if (text != password_Controller.text) {
                              return "please does not match";
                            }
                            return null;
                          },
                          keyboardType: TextInputType
                              .emailAddress, // as to show @ in keyboard
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {
                            register();
                          },
                          child: Text(
                            "register",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Already have an account"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void register() {
    if (formKey.currentState?.validate() == true) {
      // register
    }
  }
}

/*
  */
