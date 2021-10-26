import 'package:attendencedemo/logged_in/student/home.dart';
import 'package:attendencedemo/logged_in/teacher/home.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool isEmailVerified;
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    String type = data['type'];
    // isEmailVerified = data['isEmailVerified'];
    Widget homeScreen;
    homeScreen = type == 'Student' ? StudentHome() : TeacherHome();
    return homeScreen;
    // return isEmailVerified? homeScreen: Home();
    // return isEmailVerified ? homeScreen : VerifyEmail();
  }
}
