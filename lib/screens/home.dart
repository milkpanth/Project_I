import 'package:flutter/material.dart';
import 'package:gastogo/screens/signin.dart';
import 'package:gastogo/screens/signup.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: buildDrawer(),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[buildDrawerHeader(), signinMenu(), signupMenu()],
        ),
      );

  ListTile signinMenu() {
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

  ListTile signupMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader buildDrawerHeader() => UserAccountsDrawerHeader(
      accountName: Text('Guest'), accountEmail: Text('Please log in'));
}
