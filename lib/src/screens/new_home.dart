import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_fvm/src/models/restaurant.dart';
import 'package:test_fvm/src/services/auth.dart';
import 'package:test_fvm/src/widgets/globals/loading_indicator.dart';
import 'package:test_fvm/src/widgets/new_restaurant_card.dart';

// the only different is that it calls the NewRestaurantCard instead.
class NewRestaurantHomePage extends StatefulWidget {
  const NewRestaurantHomePage({super.key});

  @override
  State<NewRestaurantHomePage> createState() => _NewRestaurantHomePageState();
}

class _NewRestaurantHomePageState extends State<NewRestaurantHomePage> {
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
              context.push("/about");
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
                      return NewRestaurantCard(
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
