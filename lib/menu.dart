import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:app_rpg/createGame.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

bool slider = false;
bool visibility = false;
bool glass = false;

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainMenu(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (() {
                Future.delayed(Duration(milliseconds: 300), () {
                  slider = !slider;
                  setState(() {});
                });
                visibility = true;
                setState(() {});
              }),
              icon: Icon(
                Icons.reorder,
                color: Colors.white54,
              ),
            ),
          ),
          SideBar(),
          GameMenu()
        ],
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.easeInOutCubic,
      duration: Duration(milliseconds: 300),
      left: slider == true ? 0 : -200,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Visibility(
            visible: visibility,
            child: InkWell(
              onTap: () {
                Future.delayed(Duration(milliseconds: 300), () {
                  visibility = false;
                  setState(() {});
                });
                slider = !slider;
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width + 200,
                height: MediaQuery.of(context).size.height,
                color: visibility == false
                    ? Colors.black45
                    : slider == true
                        ? Colors.black45
                        : Color(0x00000000),
              ),
            ),
          ),
          Container(
              width: 200,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  Text(
                    "Account Name",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF274C77),
          Color(0xFF6096BA),
        ],
      )),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Pesquisar',
                      icon: Icon(
                        Icons.search,
                        color: Color.fromRGBO(25, 65, 185, 1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Por Quais Terras Vagar??s Hoje",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 25,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Nobre Viajante?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        fixedSize: Size(
                            (MediaQuery.of(context).size.width / 2) - 20, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/sword.png',
                          width: 30,
                        ),
                        Spacer(),
                        Text(
                          'Fantasia',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(181, 0, 0, 0)),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        fixedSize: Size(
                            (MediaQuery.of(context).size.width / 2) - 20, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/detective.png',
                          width: 30,
                        ),
                        Spacer(),
                        Text(
                          'Investiga????o',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(181, 0, 0, 0)),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        fixedSize: Size(
                            (MediaQuery.of(context).size.width / 2) - 20, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/humanoid.png',
                          width: 30,
                        ),
                        Spacer(),
                        Text(
                          'Apocal??ptico',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(181, 0, 0, 0)),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        fixedSize: Size(
                            (MediaQuery.of(context).size.width / 2) - 20, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                          size: 30,
                        ),
                        Spacer(),
                        Text(
                          'Ver G??neros',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(181, 0, 0, 0)),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Mesas Dispon??veis",
                    style: TextStyle(fontSize: 25, color: Colors.white70),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      glass = !glass;

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const MenuPage(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: const Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 325,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 325,
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Minhas Mesas",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Suas campanhas e as que voc?? faz parte.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                    AssetImage('assets/fantasyImage.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 325,
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Campanhas de Hoje",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "As aventuras de segunda feira.",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                    AssetImage('assets/fantasyImage.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 325,
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mesas favoritas",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Mesas favoritas",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                    AssetImage('assets/fantasyImage.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => AddButtonState();
}

class AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GameMenu extends StatefulWidget {
  const GameMenu({Key? key}) : super(key: key);

  @override
  _GameMenuState createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: glass == false ? false : true,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: InkWell(
          onTap: () {
            glass = !glass;
            setState(() {});
          },
          child: Container(
            color: Colors.black45,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(30)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.input,
                            color: Color.fromRGBO(25, 65, 185, 1),
                          ),
                          labelText: 'C??digo'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite o c??digo para continuar';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: Size(250, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "ENTRAR",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ou",
                    style: TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => const CreateGame(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: const Duration(milliseconds: 100),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: Size(320, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "CRIAR UMA SALA",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
