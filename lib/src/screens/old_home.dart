import 'package:flutter/material.dart';
import 'package:test_fvm/src/models/restaurant.dart';
import 'package:test_fvm/src/screens/about.dart';
import 'package:test_fvm/src/services/auth.dart';
import 'package:test_fvm/src/widgets/globals/loading_indicator.dart';
import '../widgets/old_restaurant_card.dart';

class OldRestaurantHomePage extends StatefulWidget {
  const OldRestaurantHomePage({super.key});

  @override
  State<OldRestaurantHomePage> createState() => _OldRestaurantHomePageState();
}

class _OldRestaurantHomePageState extends State<OldRestaurantHomePage> {
  bool isLoading = false;
  final List<Restaurant> restaurants = Restaurant.restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Screen"),
        actions: [
          TextButton.icon(
            onPressed: () async {
              setState(() => isLoading = true);

              await Auth.logout();

              setState(() => isLoading = false);
            },
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
          ),
          TextButton.icon(
            onPressed: () async {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            icon: const Icon(Icons.person),
            label: const Text("About"),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              LimitedBox(
                maxHeight: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurants.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return OldRestaurantCard(
                        restaurant: restaurants[index],
                      );
                    }),
              ),
            ],
          ),
          loadingIndicator(isLoading)
        ],
      ),
    );
  }
}
