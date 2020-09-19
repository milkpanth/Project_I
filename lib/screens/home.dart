import 'package:flutter/material.dart';
import 'package:gastogo/screens/main_user.dart';
import 'package:gastogo/screens/signin.dart';
import 'package:gastogo/screens/signup.dart';
import 'package:gastogo/unility/normal_dialog.dart';
import 'package:gastogo/unility/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPreference();
  }

  Future<Null> checkPreference() async {
    //checkuser
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String showName = preferences
          .getString('Name'); //showว่าเปนผู้คนใช้คนไหนหรือเจ้าของร้าน
      if (showName != null && showName.isEmpty) {
        if (showName == 'User') {
          routeToService(MainUser());
        } else {
          normalDialog(context, 'Error User not found');
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: buildDrawer(),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            buildDrawerHead(),
            signInMenu(),
            signUpMenu(),
          ],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(
        Icons.account_box_outlined,
        size: 35.0,
      ),
      title: Text('Sign in'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.person_add_alt_1, size: 30.0),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader buildDrawerHead() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDecoration('bg.jpg'),
        // BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('images/bg.jpg'), fit: BoxFit.cover),
        // ),
        currentAccountPicture: MyStyle().setLogo(),
        accountName:
            Text('Welcome', style: TextStyle(color: MyStyle().normalText)),
        accountEmail: Text('Please Login',
            style: TextStyle(color: MyStyle().normalText)));
  }
}
