import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20Route/named_route.dart';
import 'package:getx_flutter/Getx%20Route/pages/homepage.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'This is The Dashboard screen',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.off(HomePage());
                },
                child: Text('Go to HomePage')),
            ElevatedButton(
                onPressed: () {
                  Get.off(NamedRoute());
                },
                child: Text('Go to namedRoute Screen')),
          ],
        ),
      ),
    );
  }
}
