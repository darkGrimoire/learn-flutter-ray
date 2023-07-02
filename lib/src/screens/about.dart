import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Screen"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 0.5,
          child: Transform.translate(
            offset: Offset(0, MediaQuery.of(context).size.height * -0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Routing\nand\nNavigation",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "Created by: Faris Rizki Ekananda",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Copyright© 2023: Learning Flutter",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
