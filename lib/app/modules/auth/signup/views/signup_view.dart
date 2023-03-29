import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/auth/login/views/login_view.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const appTitle = 'MyApps';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
            shape: Border(bottom: BorderSide(color: Colors.white, width: 1)),
            elevation: 4,
            backgroundColor: Color(0xFF202B45),
            title: RichText(
              text: const TextSpan(
                text: 'My',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                children: [
                  TextSpan(
                    text: 'Jobs',
                    style: TextStyle(
                      color: Color(0xFF3B81F6),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0xFF303F60), Color(0xFF303F60)])),
            )),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

/// stateful widget that the main application instantiates
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isRecruiter = false;

  void chooseRecruiter(bool isRecruiterSelected) {
    setState(() {
      isRecruiter = isRecruiterSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
                  Color(0xFF303F60),
                ],
              )),
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
          ],
        ),
        Positioned(
          top: 80,
          left: 30,
          right: 30,
          child: Container(
            padding: EdgeInsets.all(8),
            width: 50,
            height: 550,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 5  horizontally
                    1.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: ListView(children: <Widget>[
              //Title

              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: 'I\'m a',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => chooseRecruiter(true),
                        icon: Icon(
                          Icons.person_search_outlined,
                          color: isRecruiter ? Colors.white : Color(0xFF42AFFF),
                        ),
                        label: Text(
                          "Recuriter",
                          style: TextStyle(
                              color: isRecruiter ? Colors.white : Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isRecruiter ? Color(0xFF42AFFF) : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton.icon(
                      onPressed: () => chooseRecruiter(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            !isRecruiter ? Color(0xFF42AFFF) : Colors.white,
                      ),
                      icon: Icon(
                        Icons.group_add_outlined,
                        color: !isRecruiter ? Colors.white : Color(0xFF42AFFF),
                      ),
                      label: Text(
                        "Candidate",
                        style: TextStyle(
                            color: !isRecruiter ? Colors.white : Colors.black),
                      ),
                    )),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: 'Full Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const TextField(
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your full name',
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: 'Email Address',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const TextField(
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              text: 'Password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 12),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your password',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              text: 'Confirm Password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        TextField(
                          style: TextStyle(fontSize: 12),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                            border: OutlineInputBorder(),
                            hintText: 'Enter your password',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: 'Skills',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const TextField(
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                  hintText: 'Enter your skills',
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    _navigateToHomeScreen(context);
                  },
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Have an account?',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: '  Login',
                      style: const TextStyle(
                        color: Color(0xFF42AFFE),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _navigateToSignInScreen(context);
                        },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

void _navigateToSignInScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const LoginView()));
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const LoginView()));
}

void roleSelection(String text) {
  print(text);
}
