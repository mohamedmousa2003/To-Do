/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/dialog_utils.dart';
import 'package:todo/models/my_user.dart';

import '../../firebase/firebase_manager.dart';
import '../../widget/tap_text.dart';

class Register extends StatefulWidget {
  Register({super.key});
  static String routeName = "register";
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  var full_Name_Controller = TextEditingController(text: "mohamed");
  var password_Controller = TextEditingController(text: "123456");
  var confirmation_Password_Controller = TextEditingController(text: "123456");
  var email_Controller =
      TextEditingController(text: "Mohamed11520031@gmail.com");
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
                "Register",
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: MaterialButton(
                              onPressed: () {
                                register();
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Register",
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Already have an account",style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.blue
                          ),),
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

  void register() async {
    if (formKey.currentState?.validate() == true) {
      // register
      // show loading
      DialogUtils.showLoading(context, "Loading...");
      //await Future.delayed(Duration(seconds: 3));
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email_Controller.text,
          password: password_Controller.text,
        );

        MyUser myUserFireStore =MyUser(
            id: credential.user?.uid ?? "",
            email: email_Controller.text,
            name: full_Name_Controller.text,
        );
        await FirebaseManager.addUserToFireStore(myUserFireStore);

        // hide loading
        DialogUtils.hideLoading(context);
        // show message
        DialogUtils.ShowMessage(context, "register successfully",
            messageTitle: "success",
            posActionName: "OK",
            titleTextStyle: TextStyle(
                color: greenColor, fontSize: 30, fontWeight: FontWeight.bold),
            barrierDismissible: false);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // hide loading
          DialogUtils.hideLoading(context);
          // show message
          DialogUtils.ShowMessage(context, "The password provided is too weak.",
              messageTitle: "Error",
              posActionName: "OK",
              titleTextStyle: TextStyle(
                color: redColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              barrierDismissible: false);
        }
        else if (e.code == 'email-already-in-use') {
          // hide loading
          DialogUtils.hideLoading(context);
          // show message
          DialogUtils.ShowMessage(
              context, "The account already exists for that email.",
              messageTitle: "Error",
              titleTextStyle: TextStyle(
                color: redColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              posActionName: "OK",
              barrierDismissible: false);
        }
      } catch (e) {
        // hide loading
        DialogUtils.hideLoading(context);
        // show message
        DialogUtils.ShowMessage(context, e.toString(),
            messageTitle: "Error",
            posActionName: "OK",
            titleTextStyle: TextStyle(
              color: redColor,
              fontSize: 30,
            ),
            barrierDismissible: false);
      }
    }
  }
}

  */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../../dialog_utils.dart';
import '../../firebase/firebase_manager.dart';
import '../../models/my_user.dart';
import '../../widget/tap_text.dart';

class Register extends StatefulWidget {
  Register({super.key});

  static String routeName = "register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final fullNameController = TextEditingController(text: "mohamed");
  final passwordController = TextEditingController(text: "123456");
  final confirmationPasswordController = TextEditingController(text: "123456");
  final emailController =
      TextEditingController(text: "Mohamed11520031@gmail.com");
  final formKey = GlobalKey<FormState>();

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
              "Register",
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
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
                          controller: fullNameController,
                          hint: "Full Name",
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: emailController,
                          hint: "Email",
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please enter your email";
                            }
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(text);
                            if (!emailValid) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          hint: "Password",
                          isPassword: true,
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please enter your password";
                            }
                            if (text.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: confirmationPasswordController,
                          isPassword: true,
                          hint: "Confirm Password",
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please confirm your password";
                            }
                            if (text != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: MaterialButton(
                              onPressed: register,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Register",
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Already have an account",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      // Show loading
      DialogUtils.showLoading(context, "Loading...");

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        MyUser myUserFireStore = MyUser(
          id: credential.user?.uid ?? "",
          email: emailController.text,
          name: fullNameController.text,
        );

        await FirebaseManager.addUserToFireStore(myUserFireStore);

        // Hide loading
        DialogUtils.hideLoading(context);

        // Show success message
        DialogUtils.showMessage(
          context,
          "Register successfully",
          messageTitle: "Success",
          posActionName: "OK",
          titleTextStyle: TextStyle(
            color: greenColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          barrierDismissible: false,
        );
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideLoading(context);

        if (e.code == 'weak-password') {
          DialogUtils.showMessage(
            context,
            "The password provided is too weak.",
            messageTitle: "Error",
            posActionName: "OK",
            titleTextStyle: TextStyle(
              color: redColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            barrierDismissible: false,
          );
        } else if (e.code == 'email-already-in-use') {
          DialogUtils.showMessage(
            context,
            "The account already exists for that email.",
            messageTitle: "Error",
            titleTextStyle: TextStyle(
              color: redColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            posActionName: "OK",
            barrierDismissible: false,
          );
        }
      } catch (e) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, e.toString(),
            messageTitle: "Error",
            posActionName: "OK",
            titleTextStyle: TextStyle(
              color: redColor,
              fontSize: 30,
            ),
            barrierDismissible: false);
      }
    }
  }
}
