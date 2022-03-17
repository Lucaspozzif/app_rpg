import 'dart:js';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_rpg/variables.dart';

import 'menu.dart';

class CreateGame extends StatefulWidget {
  const CreateGame({Key? key}) : super(key: key);

  @override
  _CreateGameState createState() => _CreateGameState();
}

String header = "Aqui nasce a aventura que será conhecida como:";
String hint = "Nome da campanha";
String validation = "Escolha um nome para a campanha";

int stage = 0;
final Stream<QuerySnapshot> data =
    FirebaseFirestore.instance.collection('data').snapshots();

final formKey = GlobalKey<FormState>();
final contentController = TextEditingController();

Widget nameStage = Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    decoration: BoxDecoration(
        color: Colors.white54, borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      controller: contentController,
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validation;
        }
        return null;
      },
    ),
  ),
);
Widget themeStage = Container(
  height: 500,
  child: StreamBuilder<QuerySnapshot>(
    stream: data,
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.hasError) {
        return Text("no data");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("waiting...");
      }
      final themes = snapshot.requireData;
      return ListView.builder(
        itemCount: (themes.docs[0]['themes'].length / 5).floor(),
        itemBuilder: (context, i) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['themes'][(i * 5)],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['themes'][(i * 5) + 1],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['themes'][(i * 5) + 2],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['themes'][(i * 5) + 3],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['themes'][(i * 5) + 4],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  ),
);
Widget systemStage = Container(
  height: 500,
  child: StreamBuilder<QuerySnapshot>(
    stream: data,
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.hasError) {
        return Text("no data");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("waiting...");
      }
      final themes = snapshot.requireData;
      return ListView.builder(
        itemCount: (themes.docs[0]['systems'].length / 5).floor(),
        itemBuilder: (context, i) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['systems'][(i * 5)],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['systems'][(i * 5) + 1],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['systems'][(i * 5) + 2],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['systems'][(i * 5) + 3],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: FittedBox(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                themes.docs[0]['systems'][(i * 5) + 4],
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  ),
);

@override
class _CreateGameState extends State<CreateGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF8D8BA0),
            Color.fromARGB(255, 90, 130, 163),
          ],
        )),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notes,
                    size: 40,
                    color: Colors.white70,
                  ),
                  Spacer(),
                ],
              ),
              Text(
                "Uma nova jornada começa...",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                header,
                style: TextStyle(fontSize: 20, color: Colors.white60),
              ),
              SizedBox(
                height: 100,
              ),
              stage == 0
                  ? nameStage
                  : stage == 1
                      ? themeStage
                      : stage == 2
                          ? systemStage
                          : Container(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if(stage == 0){
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => MenuPage(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                            ));
                        }else{
                          stage--;
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => CreateGame(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                            ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red.shade100,
                          fixedSize: Size(50, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        newGame['name'] = contentController.text;
                        stage++;
                          stage--;
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (c, a1, a2) => CreateGame(),
                              transitionsBuilder: (c, anim, a2, child) =>
                                  FadeTransition(opacity: anim, child: child),
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white60,
                        fixedSize: Size(230, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "PRÓXIMO",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
