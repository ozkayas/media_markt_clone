class Product {
  late String name;
  late String description;
  late double price;
  late String imageUrl;
  late String url;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.url,
      required this.imageUrl});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    url = json['url'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
