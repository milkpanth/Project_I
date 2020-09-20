//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gastogo/unility/signout_process.dart';
import 'package:gastogo/unility/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String nameUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('Name');
    });
  }

  // Future<Null> signOutProcess() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.clear();
  //   exit(0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : '$nameUser login'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => signOutProcess(context)),
        ],
      ),
      drawer: buildDrawer(),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeader(),
          ],
        ),
      );

  UserAccountsDrawerHeader showHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(
        'Name Login',
        style: TextStyle(color: MyStyle().textColor),
      ),
      accountEmail: Text('Login', style: TextStyle(color: MyStyle().textColor)),
    );
  }
}
