class Plant {
  String? name;
  double? price;
  String? image;
  String? type;
  String? description;
  double? rating;

  Plant(
      {this.name,
      this.price,
      this.image,
      this.type,
      this.description,
      this.rating});

  Plant.fromJson(Map json) {
    name = json["name"];
    price = json["price"];
    image = json["image_url"];
    type = json["type"];
    description = json["description"];
    rating = json["rating"];
  }
}
