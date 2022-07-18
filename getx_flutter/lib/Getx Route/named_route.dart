import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20Route/pages/homepage.dart';
import 'package:getx_flutter/show%20snackbar%20dialogbox,%20bottomsheet/show_snackBar.dart';

class NamedRoute extends StatelessWidget {
  const NamedRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Get.to(HomePage());
              },
              child: const Text('Go to HomePage'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(ShowSnackBar());
              },
              child: const Text('Go to show snack bar  Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
