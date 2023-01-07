import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref/user_input/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    var islogin = shp.getBool("isLogin") ?? false;
    var username = shp.getString("Name");
    var usereamil = shp.getString("Email");

    if(islogin){
      Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context)=>MyHomePage(
              name: username,
              email: usereamil,
            )));
      });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context)=>LoginPage()));
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
