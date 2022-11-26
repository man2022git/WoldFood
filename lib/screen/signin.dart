// import 'dart:ui';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woldfood/model/user_model.dart';
import 'package:woldfood/screen/main_rider.dart';
import 'package:woldfood/screen/main_shop.dart';
import 'package:woldfood/screen/main_user.dart';
import 'package:woldfood/utility/my_style.dart';
import 'package:woldfood/utility/normal_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Field
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: <Color>[Colors.white, MyStyle().primaryColor],
          center: Alignment(0, -0.3),
          radius: 1.0,
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // showLogo()
                MyStyle().showLogo(),
                // showTitle(),
                MyStyle().mySizebox(),
                MyStyle().showTitle('World Food'),
                MyStyle().mySizebox(),
                userForm(),
                MyStyle().mySizebox(),
                passwordForm(),
                MyStyle().mySizebox(),
                loginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: 250.0,
      child: ElevatedButton(
        onPressed: () {
          // print('$user  $password');
          if (user == null ||
              user!.isEmpty ||
              password == null ||
              password!.isEmpty) {
            normalDialog(context, 'มีช่องว่าง กรุณากรอกให้ครบ ค่ะ');
          } else {
            checkAuthen();
          }
        },
        style: ElevatedButton.styleFrom(backgroundColor: MyStyle().darkColor),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<Null> checkAuthen() async{
    String url = 'http://192.168.1.4/woldfood/getUserWhereUser.php?isAdd=true&User=$user';
    
    try {
      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result = $result');
      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (password == userModel.password) {
          String? chooseType = userModel.chooseType;
          if (chooseType == 'User') {
            routeTuService(MainUser(), userModel);
          } else if (chooseType == 'Shop') {
            routeTuService(MainShop(), userModel);
          } else if (chooseType == 'Rider') {
            routeTuService(MainRider(), userModel);
          } else {
            normalDialog(context, 'Error');
          }
        } else {
          normalDialog(context, 'Password ผิด กรุณาลองใหม่');
        }
      }
    } catch (e) {
      
    }
  }

  // void routeTuService(Widget myWidget) {
  Future<Null> routeTuService(Widget myWidget, UserModel userModel) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', userModel.id!);
    preferences.setString('ChooseType', userModel.chooseType!);
    preferences.setString('Name', userModel.name!);

    MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget,);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  // SizedBox mySizebox() => SizedBox();

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User:',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password:',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  // Text showTitle() => Text('World Food');

  // Container showLogo() {
  //   return Container(
  //           width: 120.0,
  //           child: Image.asset('images/logo.png'),
  //         );
  // }
}
