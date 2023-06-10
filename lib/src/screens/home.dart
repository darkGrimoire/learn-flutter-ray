import 'package:flutter/material.dart';
import 'package:test_fvm/src/models/restaurant.dart';
import '../widgets/food_card.dart';

import '../widgets/food_tile.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final List posts = [
    "seblak",
    "bakso",
    "bandros",
    "sate",
    "sop kuah",
  ];
  final List<Restaurant> restaurants = [
    Restaurant(
      image: "kopken.jpg",
      name: "Kopi Kenangan, Menara Standart Chartered",
      tags: ["Beverages", "Coffee"],
      distance: 0.12,
      priceRating: 2,
    ),
    Restaurant(
      image: "negiya.jpeg",
      name: "Negiya Express, Everplate Sudirman",
      tags: ["Japanese", "Rice", "Chicken & duck"],
      distance: 0.13,
      priceRating: 3,
    ),
    Restaurant(
      image: "mcd.jpg",
      name: "McDonald's, Plaza Sentral",
      tags: ["Fast food", "Sweets", "Snacks"],
      distance: 0.14,
      priceRating: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 100,
              child: Container(
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber[200],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber[200],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.amber[200],
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return FoodTile(post: posts[index]);
                }),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 280,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return FoodCard(
                    restaurant: restaurants[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
