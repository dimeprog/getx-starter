import 'package:get/get.dart';
import 'package:getx_flutter/shopping%20cart/firebase.dart';
import 'package:getx_flutter/shopping%20cart/models/product_model.dart';

class ProductController extends GetxController {
  final _product = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _product.bindStream(firebase().getAllProducts());
  }
}
