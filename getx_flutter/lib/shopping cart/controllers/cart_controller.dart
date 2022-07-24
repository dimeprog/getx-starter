import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  // getters
  get product => _products;
  get productSubtotal => _products.entries
      .map(
        (product) => product.key.price * product.value,
      )
      .toList();

  get totalProduct => _products.entries
      .map(
        (product) => product.key.price * product.value,
      )
      .toList()
      .reduce((value, element) => value * element)
      .toStringAsFixed(2);
// method
  addProductToCart(Product product) {
    if (_products.containsKey(product)) {
      _products[product]++;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      'Added a product',
      'You just added a new product to cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(
        seconds: 2,
      ),
      backgroundColor: Colors.white,
      colorText: Colors.pink,
    );
  }

  removeProductFromCart(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product]--;
    }
  }
}
