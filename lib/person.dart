import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About Us"),
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " name : Fouad Samy",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 1, 26), fontSize: 15),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                " city : elmahala",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 1, 26), fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "name : Fady Ibraheem ",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 1, 26), fontSize: 15),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                " city : elmanzala",
                style: TextStyle(
                    color: Color.fromARGB(255, 11, 1, 26), fontSize: 15),
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ));
  }
}
