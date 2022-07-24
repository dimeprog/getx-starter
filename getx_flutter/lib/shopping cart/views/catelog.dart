import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/shopping%20cart/controllers/cart_controller.dart';
import 'package:getx_flutter/shopping%20cart/controllers/product_contoller.dart';
import 'package:getx_flutter/shopping%20cart/models/product_model.dart';
import 'package:getx_flutter/shopping%20cart/views/cart_page.dart';

class Catelog extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  Catelog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => CatelogSampleCard(index: index),
              itemCount: productController.product.length,
              shrinkWrap: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.amber.withOpacity(0.5),
              onPressed: () => Get.to(() => CartPage()),
              child: const Text(
                'to cart',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}

class CatelogSampleCard extends StatelessWidget {
  final int index;
  ProductController productController = Get.put(ProductController());
  CartController cartContoller = Get.put(CartController());
  CatelogSampleCard({
    Key? key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Product product = productController.product[index];
    return Container(
      // color: Color(0xffFEFAE0),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 90,
      child: Row(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(40),
            child: Image.network(product.imageUrl),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              '\$${product.price.toString()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.amber,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
