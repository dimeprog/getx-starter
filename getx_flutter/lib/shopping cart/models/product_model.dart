import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final int price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    return Product(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
  }
}
