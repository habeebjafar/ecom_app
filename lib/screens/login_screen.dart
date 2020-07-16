import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final List<Product> cartItems;
  LoginScreen({this.cartItems});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 48.0, top: 14.0, right: 48.0, bottom: 14.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'youremail@example.com', labelText: 'Enter your email'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 48.0, top: 14.0, right: 48.0, bottom: 14.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Enter your password', labelText: '******'
                ),
              ),
            ),
            Column(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 320,
                  height: 45.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    color: Colors.redAccent,
                    onPressed: () {
                      
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegistrationScreen(cartItems: this.widget.cartItems,)));
                  },
                  child: FittedBox(child: Text('Register your account')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
