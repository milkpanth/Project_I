//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gastogo/unility/signout_process.dart';
import 'package:gastogo/unility/style.dart';
import 'package:gastogo/widget/listgas_shop.dart';
import 'package:gastogo/widget/order_listshop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
//Field
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'
            // nameShop == null ? 'Main Shop' : '$nameShop login'
            ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => signOutProcess(context)),
        ],
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeader(),
            orderMenu(),
            gasMenu(),
            signoutMenu(),
          ],
        ),
      );

  ListTile orderMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('Order'),
        subtitle: Text('Order waiting to make'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile gasMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('Gas Type'),
        subtitle: Text('รายละเอียดแก๊ส ยี่ ห้อ ขนาด'),
        onTap: () {
          setState(() {
            currentWidget = ListGasType();
          });
          Navigator.pop(context);
        },
      );

  ListTile signoutMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('signout'),
        subtitle: Text('back to home page'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHeader() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDecoration('bg.jpg'),
        currentAccountPicture: MyStyle().setLogo(),
        accountName: Text('Name Shop'),
        accountEmail: Text('login'));
  }
}
