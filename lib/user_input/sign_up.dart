import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> checkcondition = GlobalKey<FormState>();

  var namectrl = TextEditingController();
  var passctrl = TextEditingController();
  var emailcntrl = TextEditingController();
  var phoncntrl = TextEditingController();

  void onpressSignInSetData() async {
    var shp = await SharedPreferences.getInstance();

    var Name = namectrl.text;
    shp.setString("Name", Name);

    var Email = emailcntrl.text;
    shp.setString("Email", Email);

    var passWord = passctrl.text;
    shp.setString("userPass", passWord);

    shp.setBool("isLogin", true);

    if (checkcondition.currentState!.validate()) {
      Navigator.pop(context);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Form(
                  key: checkcondition,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]||[0-9]+$')
                                  .hasMatch(value!)) {
                            return "Enter Username";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Enter Username"),
                        controller: namectrl,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                  .hasMatch(value!)) {
                            return "Enter phone number";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Phone number"),
                        controller: phoncntrl,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value!)) {
                            return "Enter Email";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Enter Emial"),
                        controller: emailcntrl,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^(?=.*?[a-z A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{5,}$')
                                  .hasMatch(value!)) {
                            return "Enter password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Enter Password"),
                        controller: passctrl,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: onpressSignInSetData,
                    child: const Text("Sign Up")),
              ],
            ),
          ),
        ));
  }
}
