import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShimmerListview extends StatelessWidget {
  const ShimmerListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        height: 70,
        width: 100,
        child: ListTile(
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.amber,
          ),
          title: const Text(
            'Amala and Efo',
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.amberAccent,
            ),
          ),
        ),
      ),
    );
  }
}
