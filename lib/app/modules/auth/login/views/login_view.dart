import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/auth/signup/views/signup_view.dart';
import 'package:starter/app/modules/dashboard/views/dashboard_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // BaseOptions baseOptions = BaseOptions(baseUrl: Env.baseURL);
  // late Dio _dio;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Future<Map<String, dynamic>?> loginUser(
  //     Map<String, dynamic>? userData) async {
  //   try {
  //     Response response = await _dio.post(
  //       URLs.login,
  //       data: userData, //REQUEST BODY
  //       //QUERY PARAMETERS
  //     );
  //     print(response.data);
  //     //returns the successful json object
  //     if (response.data['code'] == 200) {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (BuildContext context) {
  //         return HomeView();
  //       }));
  //     } else {}
  //     return response.data;
  //   } on DioError catch (e) {
  //     //returns the error object if there is
  //     print(e.response!.data);
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _dio = Dio(baseOptions);
  // }

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
          top: 100,
          left: 30,
          right: 30,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 50,
            height: 350,
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
                  'Login',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 22),
                ),
              ),

              SizedBox(
                height: 25,
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
              TextField(
                controller: emailController,
                style: const TextStyle(fontSize: 12),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),

              const SizedBox(
                height: 15,
              ),

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
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(fontSize: 12),
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 12, 0, 12),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DashboardView();
                    }));
                    // loginUser({
                    //   'email': emailController.text,
                    //   'password': passwordController.text
                    // });
                  },
                ),
              ),

              SizedBox(
                height: 20,
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'New to MyJobs?',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: '  Create an account',
                      style: const TextStyle(
                        color: Color(0xFF42AFFE),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _navigateToSignUpScreen(context);
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

void _navigateToSignUpScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SignupView()));
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DashboardView()));
}
