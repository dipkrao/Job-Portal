import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/welcome/views/welcome_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
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
            actions: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: PopupMenuButton(
                    constraints: BoxConstraints(
                      maxHeight: 40.0,
                      maxWidth: 100.0,
                    ),
                    offset: const Offset(0, 50),
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Center(
                            child: Text(
                              "D",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    // add icon, by default "3 dot" icon
                    // icon: Icon(Icons.book)
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem<int>(
                          padding: EdgeInsets.fromLTRB(15, 0, 5, 30),
                          value: 0,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const WelcomeView()));
                      }
                    }),
              ),
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[Color(0xFF1C2740), Color(0xFF303F60)])),
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
                  Color(0xFF1C2740),
                ],
              )),
              width: MediaQuery.of(context).size.width,
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(
                            'Home',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                      child: Text(
                        'Job posted by you',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ))
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          bottom: 0.0,
          child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  padding: const EdgeInsets.all(8),
                  width: 50,
                  height: 150,
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
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Digital Marekting',
                                style: TextStyle(
                                    color: Color(0xFF494949),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                                maxLines: 1,
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(2, 10, 0, 0),
                                  child: Text(
                                    ' Digital Marekting',
                                    maxLines: 4,
                                    style: TextStyle(
                                        color: Color(0xFF494949), fontSize: 13),
                                  )),
                            ],
                          ),

                          //  Footer of card
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.home,
                                              color: Color(0xFF5FA5F9),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 4, 0, 0),
                                              child: Text(
                                                'Gurgaon',
                                                style: const TextStyle(
                                                    color: Color(0xFF494949),
                                                    fontSize: 16),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDBE9FE),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        // _getAllJobsData();
                                        _showSimpleModalDialog(context);
                                      },
                                      child: const Padding(
                                          padding: EdgeInsets.all(6),
                                          child: Text(
                                            'View Applications',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF494949),
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

_showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: const BoxConstraints(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(5, 4, 0, 0),
                          child: Text(
                            "Application for this job",
                            style: TextStyle(
                                color: Color(0xFF494949), fontSize: 16),
                          ),
                        ),
                        IconButton(
                          iconSize: 20,
                          icon: Icon(Icons.close_sharp),
                          color: Colors.black,
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ]),
                  const Divider(
                    color: Colors.black38,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: const TextSpan(
                          text: "Total 5 Applicants",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black,
                              wordSpacing: 1)),
                    ),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundColor: Colors.grey,
                                              child: Center(
                                                child: Text(
                                                  "D",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'User A',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF494949),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    'Description',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF959BA5),
                                                        fontSize: 13),
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Skills:',
                                            style: TextStyle(
                                                color: Color(0xFF494949),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            'HTML, CSS',
                                            style: const TextStyle(
                                                color: Color(0xFF494949),
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                            ));
                      }),
                ],
              ),
            ),
          ),
        );
      });
}
