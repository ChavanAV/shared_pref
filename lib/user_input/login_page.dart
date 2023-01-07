import 'package:flutter/material.dart';
import 'package:shared_pref/screens/home_page.dart';
import 'package:shared_pref/user_input/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> checkcondition = GlobalKey<FormState>();
  var namectrl = TextEditingController();
  var passctrl = TextEditingController();
  var l_userName;
  var l_userPass;

  void LogingetData() async {
    var shp = await SharedPreferences.getInstance();
    var username = shp.getString("Name");
    var usereamil = shp.getString("Email");
    var pass = shp.getString("userPass");
    l_userName = namectrl.text;
    l_userPass = passctrl.text;

    if (checkcondition.currentState!.validate()) {
      if (l_userName == username && l_userPass == pass) {
        shp.setBool("isLogin", true);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      name: username,
                      email: usereamil,
                    )));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("No user found!!!",style: TextStyle(color: Colors.teal),),
                ));
      }
    }

    setState(() {});
  }

  void signUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height: 200
            ),
            Form(
              key: checkcondition,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter user name";
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
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: "Enter Password"),
                    controller: passctrl,
                    obscureText: true,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: LogingetData,
                child: const Text("Login")
            ),

            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: signUp,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
