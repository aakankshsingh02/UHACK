import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih_finals/ananya/lib/home.dart';
import 'package:sih_finals/arnav/Arnav-main%20(2)/Arnav-main/home.dart';

import 'package:sih_finals/screens/drawer.dart';
import 'package:sih_finals/screens/sign_in.dart';
import 'package:sih_finals/screens/view_profile.dart';
import 'package:sih_finals/afsha/afsha_lib/home.dart';
import 'package:sih_finals/aman/aman_lib/screens/services_screen.dart';
import 'package:sih_finals/ananya/lib/drawer.dart';
import 'package:sih_finals/arhma/Arhma_lib/chatbot.dart';
import 'package:sih_finals/arhma/Arhma_lib/exam_screen.dart';
import 'package:sih_finals/arhma/Arhma_lib/home_screen.dart';

import 'package:sih_finals/screens/homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  late String? userId = user!.uid;

  int index = 0;
  final style = TextStyle(color: Colors.black, fontSize: 23);
  final linestyle =
      TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        height: 55,
        items: [
          Icon(
            CupertinoIcons.home,
            size: 20,
          ),
          Icon(
            CupertinoIcons.person,
            size: 20,
          ),
          Icon(
            CupertinoIcons.bars,
            size: 20,
          ),
        ],
        index: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: (index == 1)
          ? GetUserName(userId!)
          : (index == 0)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 152, 231, 245),
                        Color.fromARGB(255, 241, 239, 235),
                        Color.fromARGB(255, 248, 184, 163),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: ListView(shrinkWrap: true, children: [
                    Container(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                        ),
                        Center(
                          child: Text("ENTECH",
                              style: GoogleFonts.abrilFatface(
                                textStyle: style,
                              )),
                        ),
                        Center(
                          child: Text("WE SERVE YOU BETTER",
                              style: GoogleFonts.abrilFatface(
                                textStyle: style,
                              )),
                        ),
                        // Padding(padding: const EdgeInsets.all(10.0), child: Text("")),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Lottie.network(
                                  'https://assets1.lottiefiles.com/packages/lf20_h4bos27x.json'),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black, width: 1)),
                      child: Center(
                        child: Text("Makes life easier!",
                            style: GoogleFonts.acme(
                              textStyle: linestyle,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage_Ar()));
                                },
                                child: AspectRatio(
                                  aspectRatio: 2 / 2,
                                  child: Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.black, width: 2)),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              height: 170,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://aakankshpic.s3.ap-south-1.amazonaws.com/images/exam+form.jpg'),
                                                      fit: BoxFit.fill),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                          Text(
                                            'Exam Forms',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage_Ananya()));
                                },
                                child: AspectRatio(
                                  aspectRatio: 2 / 2,
                                  child: Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.black, width: 2)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://aakankshpic.s3.ap-south-1.amazonaws.com/images/counc.jpg'),
                                                    fit: BoxFit.fill),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                        ),
                                        Text(
                                          'Counselling',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              services_screen()));
                                },
                                child: AspectRatio(
                                  aspectRatio: 2 / 2,
                                  child: Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.black, width: 2)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          // child: AspectRatio(
                                          //   aspectRatio: 1 / 1,
                                          child: Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://aakankshpic.s3.ap-south-1.amazonaws.com/images/services.png'),
                                                    fit: BoxFit.fill),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                        ),
                                        Text(
                                          'Services',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage_Arnav()));
                                },
                                child: AspectRatio(
                                  aspectRatio: 2 / 2,
                                  child: Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.black, width: 2)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://aakankshpic.s3.ap-south-1.amazonaws.com/images/videos.jpg'),
                                                    fit: BoxFit.fill),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                        ),
                                        Text(
                                          'Video Trainings',
                                          style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AfshaHomePage()));
                                },
                                child: AspectRatio(
                                  aspectRatio: 2 / 2,
                                  child: Card(
                                    color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: BorderSide(
                                            color: Colors.black, width: 2)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Container(
                                            height: 170,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://aakankshpic.s3.ap-south-1.amazonaws.com/images/spo.jpg'),
                                                    fit: BoxFit.fill),
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                        ),
                                        Text(
                                          'Sponsored Content',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'WITH ENTECH',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '-> You will be provided with study materials for every competetive exams.\n\n-> Study material of every subject is provied.\n\n-> It includes all engineering branches.\n\n-> You will be provided with study material for exams like UPSC, Neet, Gate, Railway etc.\n\n-> Exams like UPSC are easy to crack with ENTECH ',
                        style: (TextStyle(fontSize: 11)),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child:
                    //       Text('Study material of every subject is provied.'),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text('It includes all engineering branches.'),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //       'You will be provided with study material for international exams like TOEFL,SAT,GRE,etc.'),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //       'Exams like UPSC are easy to crack with ENTECH '),
                    // )
                  ]))
              : (index == 2)
                  ? MyDrawer()
                  : Container(),
    );
  }
}
