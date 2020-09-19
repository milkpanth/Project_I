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
      appBar: AppBar(),
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
      leading: Icon(Icons.android),
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
      leading: Icon(Icons.android),
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
        accountName: Text('Guest'),
        accountEmail: Text('Please Login'));
  }
}
