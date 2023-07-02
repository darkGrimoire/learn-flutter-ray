import 'package:flutter/material.dart';
import 'package:test_fvm/src/models/restaurant.dart';
import 'package:test_fvm/src/screens/restaurant_detail.dart';

class OldRestaurantCard extends StatelessWidget {
  const OldRestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;
  final int maxPriceRating = 4;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailPage(restaurant: restaurant),
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    restaurant.image,
                  ),
                ),
                Text(
                  restaurant.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .merge(const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text(
                  restaurant.tags.join(", "),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.red[800],
                      ),
                      Text(
                        "${restaurant.distance} km",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ]),
                    Row(children: [
                      for (var i = 0; i < maxPriceRating; i++)
                        Icon(
                          Icons.attach_money,
                          size: 18,
                          color: i < restaurant.priceRating
                              ? Colors.black
                              : Colors.grey,
                        ),
                    ])
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
