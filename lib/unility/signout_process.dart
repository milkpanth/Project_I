import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter/material.dart';

Future<Null> signOutProcess() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  exit(0);
}
