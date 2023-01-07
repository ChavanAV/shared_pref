import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref/user_input/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  final name,email;
  MyHomePage({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void logOut() async  {
    SharedPreferences shp = await SharedPreferences.getInstance();
    shp.setBool("isLogin", false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context)=>LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(150),
                ),
                color: Colors.teal
              ),
              margin: EdgeInsets.zero,
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJNJWuFFn6JGSOHB39gNh6X_VLXmAL-9nkPKBb6u0j&s"),
              ),
                accountName: Text(widget.name,style: TextStyle(color: Colors.black)),
                accountEmail: Text(widget.email,style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                onTap: logOut,
                title: Text("Logout"),
                leading: Icon(Icons.logout),
                iconColor: Colors.black,
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: const Text("Home Screen"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(child: Text("Home Screen"))

        ],
      ),
    );
  }
}
