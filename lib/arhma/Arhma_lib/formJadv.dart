import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sih_finals/flobalVariables.dart';
import 'package:sih_finals/screens/homepage.dart';
import 'package:sih_finals/screens/payment.dart';

class jAdv extends StatefulWidget {
  final String documentId;

  jAdv(this.documentId);

  @override
  State<jAdv> createState() => _FormAppState();
}

class _FormAppState extends State<jAdv> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.width * 0.3, 20, 0),
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(widget.documentId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        shadowColor: Colors.blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.white70,
                        child: ListTile(
                          title: Text(
                            "Name:  " + data['name'],
                            style: TextStyle(
                                color: Color.fromARGB(255, 13, 91, 155),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Card(
                        shadowColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Color.fromARGB(255, 13, 91, 155),
                        child: ListTile(
                          title: Text(
                            "Email:  " + data['email'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Card(
                        shadowColor: Colors.blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.white70,
                        child: ListTile(
                          title: Text(
                            "Aadhar Number:  " +
                                (data['aadhar details']).toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 13, 91, 155),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Card(
                        shadowColor: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Color.fromARGB(255, 13, 91, 155),
                        child: ListTile(
                          title: Text(
                            "HSC Roll Number:  " +
                                (data['hsc roll number']).toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Card(
                        shadowColor: Colors.blue,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.white70,
                        child: ListTile(
                          title: Text(
                            "Grad Roll Number:  " +
                                (data['grad roll number']).toString(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 13, 91, 155),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(79, 5, 79, 5),
                        child: Card(
                          shadowColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Color.fromARGB(255, 13, 91, 155),
                          child: ListTile(
                            title: Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Icon(
                              CupertinoIcons.upload_circle,
                              color: Colors.white,
                            ),
                            onTap: () {
                              addformData(data['email']).then((value) {
                                if (value) {
                                  const snackBar = SnackBar(
                                      content: Text("Filled Successfully"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Payment()));
                                  setState(() {
                                    price = 500;
                                  });
                                } else {
                                  const snackBar = SnackBar(
                                      content: Text(" Already Filled"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(79, 5, 79, 5),
                        child: Card(
                          shadowColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Color.fromARGB(255, 13, 91, 155),
                          child: ListTile(
                            title: const Text(
                              'Home',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: Icon(
                              CupertinoIcons.home,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(
                child: SpinKitCubeGrid(
              size: 140,
              color: Colors.blue.shade700,
            ));
          },
        ),
      ),
    );
  }

  Future addformData(String email1) async {
    final user = FirebaseAuth.instance.currentUser;
    final userDocRef =
        FirebaseFirestore.instance.collection('Jee Adv').doc(user?.uid);
    final doc = await userDocRef.get();
    if (!doc.exists) {
      await FirebaseFirestore.instance
          .collection('Jee Adv')
          .doc(user?.uid)
          .set({'email': email1}).catchError((err) {
        print('Error: $err');
      });
      return (true);
    } else {
      return (false);
    }
  }
}
