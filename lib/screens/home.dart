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
      // body: BodyHome(),
      //===============================
      // body: Container(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     //mainAxisAlignment: MainAxisAlignment.center,
      //     //crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         //padding: EdgeInsets.all(50),
      //         width: 150.0,
      //         height: 80.0,
      //         child: Image.network(
      //             'https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.0-9/105353239_110970653993849_5496117879721965726_o.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_ohc=ZXZH8At8zdYAX8k2aQB&_nc_ht=scontent.fbkk5-5.fna&oh=745e6216ddbe8454c4eba58d730150ff&oe=5F8C1FD8'),
      //       ),
      //       Text('สหกรณ์ 3 แก๊ส'),
      //     ],
      //   ),
      // ),
      //===============================
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
