import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/auth/login/views/login_view.dart';
import 'package:starter/app/modules/auth/signup/views/signup_view.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const appTitle = 'MyApps';
    return MaterialApp(
        title: appTitle,
        home: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
                shape: const Border(
                    bottom: BorderSide(color: Colors.white, width: 1)),
                elevation: 4,
                title: RichText(
                  text: const TextSpan(
                    text: 'My',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: 'Jobs',
                        style: TextStyle(
                          color: Color(0xFF3B81F6),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF3B81F6),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginView()));
                          },
                          child: const Text(
                            'Login /',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupView()));
                          },
                          child: const Text(
                            ' SignUp',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color>[
                        Color(0xFF303F60),
                        Color(0xFF1C2740),
                      ])),
                )),
            body: const MyCustomForm(),
          ),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF303F60),
                Color(0xFF1C2740),
              ],
            )),
            width: MediaQuery.of(context).size.width,
            height: 300,
          ),
        ],
      ),
      Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: <Widget>[
            const Text(
              'Welcome To',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 30),
            ),

            RichText(
              text: const TextSpan(
                text: 'My',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: 'Jobs',
                    style: TextStyle(
                      color: Color(0xFF42AFFE),
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 100, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  child: const Text('Get Started'),
                  onPressed: () {
                    _navigateToSignUpScreen(context);
                  },
                ),
              ),
            ),

            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/home.png',
                      height: 250,
                      width: 450,
                    ),
                  ],
                )),

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 100, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Why Us',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),

            // Container First
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0, // soften the shadow
                    spreadRadius: .4, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 5  horizontally
                      0.5, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      'Get More Visibility',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0, // soften the shadow
                    spreadRadius: .4, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 5  horizontally
                      0.5, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      'Organize your candidates',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0, // soften the shadow
                    spreadRadius: .4, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 5  horizontally
                      0.5, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      'Verify their abilities',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 100, 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Company who trust us',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset('assets/images/solaytic.png',
                          height: 80, width: 100),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/lighting.png',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Image.asset('assets/images/kanba.png',
                          height: 80, width: 100),
                    ),
                    Expanded(
                      child: Image.asset('assets/images/ztos.png',
                          height: 80, width: 100),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset('assets/images/goldline.png',
                          height: 80, width: 100),
                    ),
                    Expanded(
                      child: Image.asset('assets/images/ideaa.png',
                          height: 80, width: 100),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset('assets/images/velocity-9.png',
                          height: 80, width: 100),
                    ),
                    Expanded(
                      child: Image.asset('assets/images/liva.png',
                          height: 80, width: 100),
                    ),
                  ],
                ),
              ],
            )
          ]))
    ]);
  }
}

void _navigateToSignUpScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SignupView()));
}

void _navigateToSignInScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const LoginView()));
}
