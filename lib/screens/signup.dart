import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gastogo/unility/normal_dialog.dart';
import 'package:gastogo/unility/style.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name, user, password;
  int phonenumber;
  //String chooseType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          gtgLogo(),
          MyStyle().buildSizedBox(),
          appName(),
          MyStyle().buildSizedBox(),
          nameForm(),
          MyStyle().buildSizedBox(),
          userForm(),
          MyStyle().buildSizedBox(),
          passwordForm(),
          MyStyle().buildSizedBox(),
          phoneForm(),
          MyStyle().buildSizedBox(),
          // MyStyle().showText('ชนิดของสมาชิก : '),
          // MyStyle().buildSizedBox(),
          // typeUser(),
          // // MyStyle().buildSizedBox(),
          // typeShop(),
          // // MyStyle().buildSizedBox(),
          // typeRider(),
          // MyStyle().buildSizedBox(),
          registerButton(),
        ],
      ),
    );
  }

  Widget registerButton() => Container(
      width: 150.0,
      child: RaisedButton(
        color: MyStyle().textColor,
        onPressed: () {
          // print(
          //     'name = $name, user = $user, password = $password, chooseType = $chooseType');
          print(
              'name = $name, user = $user, password = $password, phonenumber = $phonenumber');
          if (name == null ||
              name.isEmpty ||
              user == null ||
              user.isEmpty ||
              password == null ||
              password.isEmpty ||
              phonenumber == null ||
              phonenumber.isNaN) {
            print('Have Space');
            normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
            // } else if (chooseType == null) {
            //   normalDialog(context, 'โปรดเลือกประเภทของคุณ');
          } else {
            registerThread();
          }
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ));

  Future<Null> registerThread() async {
    String url =
        'http://192.168.64.2/GastoGo/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password&Phonenumber=$phonenumber';
    // path api อยู่ตรงไหน
    try {
      Response response = await Dio().get(url);
    } catch (e) {}
  }

  // Widget registerButton() => Container(
  //     width: 150.0,
  //     child: RaisedButton(
  //       color: MyStyle().textColor,
  //       onPressed: () {
  //         print(
  //             'name = $name, user = $user, password = $password, chooseType = $chooseType');
  //         if (name == null ||
  //             name.isEmpty ||
  //             user == null ||
  //             user.isEmpty ||
  //             password == null ||
  //             password.isEmpty ||
  //             chooseType == null ||
  //             chooseType.isEmpty) {
  //           print('Have Space');
  //           normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
  //         } else if (chooseType == null) {
  //           normalDialog(context, 'โปรดเลือกประเภทของคุณ');
  //         } else {}
  //       },
  //       child: Text(
  //         'Register',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ));

  // Widget typeUser() => Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           width: 250.0,
  //           child: Row(
  //             // crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Radio(
  //                   value: 'User',
  //                   groupValue: chooseType,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       chooseType = value;
  //                     });
  //                   }),
  //               Text(
  //                 'User order',
  //                 style: TextStyle(color: MyStyle().textColor),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );

  // Widget typeShop() => Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           width: 250.0,
  //           child: Row(
  //             // crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Radio(
  //                   value: 'Shop',
  //                   groupValue: chooseType,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       chooseType = value;
  //                     });
  //                   }),
  //               Text(
  //                 'Own Shop',
  //                 style: TextStyle(color: MyStyle().textColor),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );

  // Widget typeRider() => Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           width: 250.0,
  //           child: Row(
  //             // crossAxisAlignment: CrossAxisAlignment.center,
  //             children: <Widget>[
  //               Radio(
  //                   value: 'Rider',
  //                   groupValue: chooseType,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       chooseType = value;
  //                     });
  //                   }),
  //               Text(
  //                 'Rider',
  //                 style: TextStyle(color: MyStyle().textColor),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) =>
                  name = value.trim(), //ช่องว่างหน้าคำหลังคำออก
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.face, color: MyStyle().textColor),
                labelStyle: TextStyle(color: MyStyle().textColor),
                labelText: 'Name :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().textColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().bgColor)),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box, color: MyStyle().textColor),
                labelStyle: TextStyle(color: MyStyle().textColor),
                labelText: 'User :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().textColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().bgColor)),
              ),
            ),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              obscureText: true,
              onChanged: (value) => password = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box, color: MyStyle().textColor),
                labelStyle: TextStyle(color: MyStyle().textColor),
                labelText: 'Password :',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().textColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().bgColor)),
              ),
            ),
          ),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: MyStyle().textColor),
                labelStyle: TextStyle(color: MyStyle().textColor),
                labelText: 'Phone number : +66 ',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().textColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().bgColor)),
              ),
            ),
          ),
        ],
      );

  Row appName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showName('GastoGo'),
      ],
    );
  }

  Widget gtgLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().setLogo(),
        ],
      );
}
