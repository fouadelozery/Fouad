import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  const Component({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://www.ansa.it/webimages/news_base/2023/11/26/12cb14421175cab90379ea8024d27b2c.jpg"),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.teal,
                ),
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber,
              ),
            )
          ],
        ),
        const Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          "fady ibraheem",
          style: TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
