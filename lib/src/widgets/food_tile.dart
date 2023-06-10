import 'package:flutter/material.dart';

class FoodTile extends StatefulWidget {
  const FoodTile({super.key, required this.post});

  final String post;

  @override
  State<FoodTile> createState() => _FoodTileState();
}

class _FoodTileState extends State<FoodTile> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        setState(() {
          counter++;
        }),
        print(counter),
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        height: 100,
        color: Colors.amber[200],
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(widget.post),
            Text(counter.toString()),
            Image.asset(
              "assets/images/kopken.jpg",
              width: 50,
              height: 50,
              fit: BoxFit.scaleDown,
            )
          ],
        ),
      ),
    );
  }
}
