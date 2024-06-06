import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/app_color.dart';
import 'package:todo/pages/redister/register.dart';
import 'package:todo/widget/tap_text.dart';

import '../../dialog_utils.dart';
import '../bottom_navigationBar/home_layout.dart';

class Login extends StatefulWidget {
  Login({super.key});

  static String routName = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var password_Controller = TextEditingController(text: "123456");

  var email_Controller = TextEditingController(text: "mohamed@gmail.com");

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
                        SizedBox(
                          height: 10,
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
                                login();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Login",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont have an account. "),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Register.routeName);
                                },
                                child: Text(
                                  "Register ",
                                  style: TextStyle(color: blueColor),
                                )),
                          ],
                        )
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

  void login() async{
    if (formKey.currentState?.validate() == true) {
      // Login
      // show loading
      DialogUtils.showLoading(context, "Loading...");
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email_Controller.text,
            password: password_Controller.text
        );
        // hide loading
        DialogUtils.hideLoading(context);
        // show message
        DialogUtils.ShowMessage(
            context,
            "Login successfully",
            messageTitle: "success",
            posActionName: "OK",
            onPressedPosActionName: () {
              Navigator.pushNamed(context,  HomeLayout.routeName);
            },
            titleTextStyle: TextStyle(
                color: greenColor,
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
            barrierDismissible: false
        );
        print("Login success");
      print(credential.user?.uid??"");
      } catch(e){
        // hide loading
        DialogUtils.hideLoading(context);
        // show message
        DialogUtils.ShowMessage(
            context,
            e.toString(),
            messageTitle: "Error",
            posActionName: "OK",
            titleTextStyle: TextStyle(
              color: redColor,
              fontSize: 30,
            ),
            barrierDismissible: false
        );
      }
    }
  }
}
