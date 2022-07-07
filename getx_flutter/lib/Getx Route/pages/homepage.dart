import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20Route/named_route.dart';
import 'package:getx_flutter/Getx%20Route/pages/dashboardpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'This is The Home screen',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(DashBoardPage());
                },
                child: const Text('Go to DashboardPage')),
            ElevatedButton(
                onPressed: () {
                  Get.off(NamedRoute());
                },
                child: const Text('Go to namedRoute Screen')),
          ],
        ),
      ),
    );
  }
}
