import 'package:get/get.dart';
import 'package:getx_flutter/shopping%20cart/controllers/baseExecptionController.dart';
import 'package:getx_flutter/shopping%20cart/server%20services/firebase.dart';
import 'package:getx_flutter/shopping%20cart/models/product_model.dart';

class ProductController extends GetxController with BaseExecptionController {
  final _product = <Product>[].obs;
  // getter
  List<Product> get product => _product.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _product.bindStream(
      firebase()
          .getAllProducts()
          .handleError(BaseExecptionController.handleError),
    );
  }
}
