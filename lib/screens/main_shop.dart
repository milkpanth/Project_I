//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gastogo/unility/signout_process.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  // String nameShop;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // findShop();
  }

  // Future<Null> findShop() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     nameShop = preferences.getString('Name');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'
            // nameShop == null ? 'Main Shop' : '$nameShop login'
            ),
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(Icons.logout),
        //       onPressed: () => signOutProcess(context)),
        // ],
      ),
    );
  }
}
