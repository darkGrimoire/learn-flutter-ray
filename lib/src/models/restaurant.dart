class Restaurant {
  int id;
  String image;
  String name;
  List tags;
  double distance;
  int priceRating;

  Restaurant({
    required this.id,
    required image,
    required this.name,
    required this.tags,
    required this.distance,
    required this.priceRating,
  }) : image = "assets/images/$image";

  // Somehow json is needed to serialize a model into a router parameter
  // in route v2.
  Restaurant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        name = json['name'],
        tags = json['tags'],
        distance = json['distance'],
        priceRating = json['priceRating'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'tags': tags,
        'distance': distance,
        'priceRating': priceRating,
      };

  static List<Restaurant> get restaurants {
    return [
      Restaurant(
        id: 1,
        image: "kopken.jpg",
        name: "Kopi Kenangan, Menara Standart Chartered",
        tags: ["Beverages", "Coffee"],
        distance: 0.12,
        priceRating: 2,
      ),
      Restaurant(
        id: 2,
        image: "negiya.jpeg",
        name: "Negiya Express, Everplate Sudirman",
        tags: ["Japanese", "Rice", "Chicken & duck"],
        distance: 0.13,
        priceRating: 3,
      ),
      Restaurant(
        id: 3,
        image: "mcd.jpg",
        name: "McDonald's, Plaza Sentral",
        tags: ["Fast food", "Sweets", "Snacks"],
        distance: 0.14,
        priceRating: 3,
      ),
    ];
  }
}
