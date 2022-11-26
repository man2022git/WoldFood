import 'package:flutter/material.dart';
import 'package:woldfood/utility/my_style.dart';
import 'package:woldfood/utility/sigout_process.dart';

class MainRider extends StatefulWidget {
  const MainRider({super.key});

  @override
  State<MainRider> createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Rider'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeader(),
            // homeMenu(),
          ],
        ),
      );

  

  UserAccountsDrawerHeader showHeader() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDecoration('rider.jpg'),
        currentAccountPicture: MyStyle().showLogo(),
        accountName: Text(
          'Name Login',
          style: TextStyle(color: MyStyle().darkColor),
        ),
        accountEmail: Text(
          'Login',
          style: TextStyle(color: MyStyle().primaryColor),
        ));
  }
}
