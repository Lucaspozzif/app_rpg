import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => GamePageState();
}

final Stream<QuerySnapshot> data =
    FirebaseFirestore.instance.collection('data').snapshots();

Map gameData = {
  'name': 'A Lenda do Rei Mago',
  'description':
      'Das terras desoladas do norte, um mago emerge, sem histórico, sem passado nem nada ele surge, sua força avassaladora com certeza seria o fim do reino, contudo, tudo mudou quando ele apareceu.',
  'stars': 4.4,
  'themes': [false, false, false, true, true, false, false, false, false, true],
  'system': 1,
  'players': ['flavio', 'teste2', 'mentos', 'pozzi', 'pedro gay'],
  'master': 'Pozzi',
};
List usedThemes = [];
double size = 45;
double rating = gameData['stars'];

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF274C77),
                  Color(0xFF6096BA),
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/fantasyImage.jpg',
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x9D274C77),
                                Color(0xFF274C77),
                              ]),
                          color: Color(0xFF274C77),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200),
                            topRight: Radius.circular(200),
                          ),
                        ),
                        child: SizedBox(
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                        )),
                  ],
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutCubic,
                  child: Column(
                    children: [
                      Text(
                        gameData['name'].toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFE7ECEF)),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: data,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot,
                          ) {
                            if (snapshot.hasError) {
                              return Text(gameData['description']);
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Text(gameData['description']);
                            }
                            final themes = snapshot.requireData;

                            return InkWell(
                                onTap: () {
                                  rating = gameData['stars'];
                                  setState(() {
                                    if (size == 100) {
                                      size = 45;
                                    } else {
                                      size = 100;
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  curve: Curves.easeInOutCubic,
                                  duration: Duration(milliseconds: 300),
                                  height: size,
                                  child: Temas(themes),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${gameData['stars']} / 5.0',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE7ECEF)),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 30,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, i) {
                              if (rating > 0.85) {
                                rating--;
                                return Icon(
                                  Icons.star,
                                  color: Color(0xA9E7ECEF),
                                );
                              } else if (rating > 0.4 && rating < 0.85) {
                                rating--;
                                return Icon(
                                  Icons.star_half,
                                  color: Color(0xA9E7ECEF),
                                );
                              } else {
                                return Icon(
                                  Icons.star_border,
                                  color: Color(0xA9E7ECEF),
                                );
                              }
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Column(children: [
                              Text(
                                gameData['master'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white70),
                              ),
                              Nomes(),
                            ]),
                            Spacer(),
                            Container(
                              child: (StreamBuilder<QuerySnapshot>(
                                stream: data,
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot,
                                ) {
                                  if (snapshot.hasError) {
                                    return Text("no data");
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("waiting...");
                                  }
                                  final themes = snapshot.requireData;
                                  return Text(
                                    themes.docs[0]['systems']
                                        [gameData['system']],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFE7ECEF)),
                                  );
                                },
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                        height: size == 45 ? 100 : 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              width: 120,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(218, 231, 236, 239),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.chat,
                                    size: 25,
                                  ),
                                  Text('Chat'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              width: 120,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(218, 231, 236, 239),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/d20.png',
                                    height: 25,
                                  ),
                                  Text('Dados'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              width: 120,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(218, 231, 236, 239),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Icon(Icons.history_edu, size: 25),
                                  Text('Ficha'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Container(
                              width: 120,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(218, 231, 236, 239),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  Icon(Icons.book, size: 25),
                                  Text('Arquivo'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (() {}),
              icon: Icon(
                Icons.reorder,
                color: Colors.white54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Nomes() {
    if (gameData['players'].length < 2) {
      return Text(gameData['players'].join(' '));
    }
    return Text(
      "${gameData['players'][0]}, ${gameData['players'][1]} e ${gameData['players'].length - 2} outros",
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white54),
    );
  }

  Temas(themes) {
    List usedThemes = [];
    for (var i = 0; i < gameData['themes'].length; i++) {
      if (gameData['themes'][i] == true) {
        usedThemes.add(themes.docs[0]['themes'][i]);
      }
    }
    String text = '${gameData['description']} \n #${usedThemes.join(' #')}';
    return Text(text,
        style: TextStyle(
            fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white54));
  }
}
