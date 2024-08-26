import 'package:flutter/material.dart';
import 'package:flutterf/HomePage.dart';
import 'package:flutterf/catogryproduct.dart';
import 'package:flutterf/person.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Aboutus> {
  int currentindex = 0;
  List screen = [const HomePage(), const CategoryProduct(), const Person()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp), label: "catogryproduct"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp), label: "PERSON"),
        ],
      ),
    );
  }
}
