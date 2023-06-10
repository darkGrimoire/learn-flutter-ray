class Restaurant {
  String image;
  String name;
  List tags;
  double distance;
  int priceRating;

  Restaurant({
    required image,
    required this.name,
    required this.tags,
    required this.distance,
    required this.priceRating,
  }) : image = "assets/images/$image";
}
