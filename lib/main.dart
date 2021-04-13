import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proxyprovider/homeProvider.dart';
import 'package:testapp/proxyprovider/login.dart';
import 'package:testapp/proxyprovider/userProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProxyProvider<UserProvider, HomeProvider>(
          create: (_) => HomeProvider(),
          update: (_, UserProvider userProvider, HomeProvider homeProvider) =>
              HomeProvider(userProvider: userProvider),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //for proxyProvider
        home: LoginForm(),
      ),
    );
  }
}
