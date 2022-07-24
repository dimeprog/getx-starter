import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class firebase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firestore.collection('products').snapshots().map((snap) {
      return snap.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}
