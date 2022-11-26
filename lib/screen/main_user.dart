// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woldfood/utility/my_style.dart';
import 'package:woldfood/utility/sigout_process.dart';

class MainUser extends StatefulWidget {
  const MainUser({super.key});

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String? nameUser;

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

  // Future<Null> signOutProcess() async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.clear();
  //   exit(0);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Main User'),),
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : '$nameUser Login'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            // onPressed: () => signOutProcess(),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      // terminal bash flutter run
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHead(),
          ],
        ),
      );

  UserAccountsDrawerHeader showHead() {
    return UserAccountsDrawerHeader(decoration: MyStyle().myBoxDecoration('user.jpg'),
        currentAccountPicture: MyStyle().showLogo(),
        accountName: Text('Name Login', style: TextStyle(color: MyStyle().darkColor),),
        accountEmail: Text('Login', style: TextStyle(color: MyStyle().primaryColor),));
  }
}
