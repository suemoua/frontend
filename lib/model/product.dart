import 'dart:convert';

List<Product> productModelFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  String? id;
  String? title;
  String? desc;
  String? img;
  int? price;
  int? qty;

  Product({this.id, this.title, this.desc, this.img, this.price, this.qty});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['_id'],
    title: json['title'],
    desc: json['desc'],
    img: json['img'],
    price: json['price'],
    qty: json['qty'],
  );
}