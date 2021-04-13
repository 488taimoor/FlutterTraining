import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:testapp/proxyprovider/home/home.dart';
import 'package:testapp/proxyprovider/user.dart';
import 'package:testapp/proxyprovider/userProvider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _autoValidate;

  GlobalKey<FormState> _formKey;

  TextEditingController _usernameTextEditingController;
  TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    super.initState();

    _autoValidate = false;

    _formKey = GlobalKey<FormState>();

    _usernameTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _usernameTextEditingController,
                  decoration: InputDecoration(labelText: "Username"),
                  validator: (String value) =>
                      _validateFormField(value, "Username")),
              TextFormField(
                  controller: _passwordTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (String value) =>
                      _validateFormField(value, "Password")),
              TextButton(
                onPressed: _onLoginPressed,
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLoginPressed() {
    setState(() {
      _autoValidate = true;
    });

    if (_formKey.currentState.validate()) {
      User _user = new User(
        username: _usernameTextEditingController.text,
      );
      Provider.of<UserProvider>(context, listen: false).setUser(_user);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  String _validateFormField(String value, String fieldName) {
    if (value.isEmpty) {
      return "$fieldName cannot be empty.";
    }

    return null;
  }

  @override
  void dispose() {
    _usernameTextEditingController.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }
}
