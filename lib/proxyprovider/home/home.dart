import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proxyprovider/homeProvider.dart';
import 'package:testapp/proxyprovider/user.dart';
import 'package:testapp/proxyprovider/userProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer2<UserProvider, HomeProvider>(
          builder: (context, userProvider, homeProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Column(
                    children: [
                      Text("this is user provider"),
                      Text(userProvider.user.username.toString()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Card(
                  child: Column(
                    children: [
                      Text("this is home provider"),
                      Text(homeProvider.greeting),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      User _user =
                          new User(username: "changed from home provideer");
                      homeProvider.setUser(_user);
                    },
                    child: Text("change user provider from home provider."))
              ],
            );
          },
        ),
      ),
    );
  }
}
