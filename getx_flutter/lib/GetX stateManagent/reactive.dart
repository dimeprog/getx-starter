import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/GetX%20stateManagent/reactive%20_custom_class.dart';
import 'package:getx_flutter/GetX%20stateManagent/state_management_with_controller.dart';

class Reactive extends StatelessWidget {
  var count = 0.obs;
  void increament() {
    count.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX reactive'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Text(
                  'Count  is   ${count.value}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                );
              }),
              ElevatedButton(
                onPressed: () {
                  increament();
                  print(count.value);
                },
                child: const Text('increament button'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => ObxWithCustomClass());
                },
                child: const Text('obx with custom class'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => StateWithController());
                },
                child: const Text(' state management with getx controller'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
