import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  const ForgotpasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Forgot Password';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(appTitle),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(children: <Widget>[
        //Title
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),

        Container(
          padding: const EdgeInsets.all(10),
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Password',
              prefixIcon: Icon(Icons.password, color: Colors.black54),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(10),
          child: const TextField(
            keyboardType: TextInputType.none,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm New Password',
              prefixIcon: Icon(Icons.password, color: Colors.black54),
              prefixIconConstraints:
                  BoxConstraints(minWidth: 32, minHeight: 32),
            ),
          ),
        ),

        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Proceed'),
              onPressed: () {},
            )),
      ]),
    );
  }
}
