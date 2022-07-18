import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20Route/pages/homepage.dart';

import '../show snackbar dialogbox, bottomsheet/show_snackBar.dart';

class UnNnamedRoute extends StatelessWidget {
  const UnNnamedRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Named Route'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'This is The unNamed Routes screen',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/homePage');
              },
              child: const Text('Go to HomePage'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/showsnack');
              },
              child: const Text('Go to show snack bar  Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
