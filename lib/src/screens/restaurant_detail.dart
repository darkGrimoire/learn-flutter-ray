import 'package:flutter/material.dart';
import 'package:test_fvm/src/models/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key, required this.restaurant});

  final Restaurant restaurant;
  final int maxPriceRating = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Detail Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
