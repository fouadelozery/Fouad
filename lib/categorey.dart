import 'package:flutter/material.dart';

class Category1 extends StatelessWidget {
  const Category1(
      {super.key,
      required this.name,
      required this.message,
      required this.image,
      required this.price});

  final String name;
  final String message;
  final String image;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(image),
            ), /*
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.teal,
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.teal,
              ),
            )*/
          ],
        ),
        const SizedBox(
          width: 7,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3, bottom: 3),
          child: Column(
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                "$message ",
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: /* Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(2)),
          ),*/

                Text(
              "$price ",
              style: const TextStyle(fontSize: 14),
            ))
      ],
    );
  }
}
