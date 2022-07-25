import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/shopping%20cart/controllers/cart_controller.dart';
import 'package:getx_flutter/shopping%20cart/models/product_model.dart';

class CartPage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color(0xfc0b7b1),
        title: const Text(
          'Cart Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            CartPageListview(),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CartTotal(),
    );
  }
}

class CartPageListview extends StatelessWidget {
  CartController controller = Get.put(CartController());
  CartPageListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
          itemBuilder: (context, index) => CartItem(
            index: index,
            controller: controller,
            product: controller.products.keys.toList()[index],
            quantity: controller.products.values.toList()[index],
          ),
          itemCount: controller.products.length,
        );
      }),
    );
  }
}

class CartItem extends StatelessWidget {
  final int index;
  final controller;
  final int quantity;
  final Product product;
  CartItem({
    Key? key,
    required this.index,
    required this.controller,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    final screenWidth = MediaQuery.of(context).size.width;
    double getHeight(double convertHeight) {
      const figmaDesignHeight = 812;
      double newScreenHeight = figmaDesignHeight / convertHeight;
      return screenHeight / newScreenHeight;
    }

    double getWidth(double convertWidth) {
      const figmaDesignWidth = 375;
      double newScreenWidth = figmaDesignWidth / convertWidth;
      return screenWidth / newScreenWidth;
    }

    return Container(
      margin: EdgeInsets.all(8),
      height: getHeight(120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffCCD5AE),
      ),
      child: Row(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(getHeight(40)),
            child: Image.network(product.imageUrl),
          ),
          SizedBox(
            width: getWidth(5),
          ),
          Expanded(
            // width: getWidth(50),ß
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getWidth(5),
          ),
          Container(
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    controller.removeProductFromCart(product);
                  },
                  icon: Icon(Icons.remove)),
              Text(
                quantity.toString(),
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 15,
                ),
              ),
              IconButton(
                  onPressed: () {
                    controller.addProductToCart(product);
                  },
                  icon: Icon(Icons.add))
            ]),
          )
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartController controller = Get.put(CartController());
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: const Center(
                  child: Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Center(
                  child: Text(
                    controller.totalProduct,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
