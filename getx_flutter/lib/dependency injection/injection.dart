import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/dependency%20injection/injection_controller.dart';

class Injection extends StatefulWidget {
  const Injection({Key? key}) : super(key: key);

  @override
  State<Injection> createState() => _InjectionState();
}

class _InjectionState extends State<Injection> {
  //  Get.put
  // InjectionController _controller = Get.put(InjectionController());
  //

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut
    // Get.lazyPut(() => InjectionController());
    //  Get.create
    // Get.create(() => InjectionController())
    // Get.async Put
    Get.putAsync(() async => await InjectionController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Depency Injection',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //  Get.put
                // _controller;
                // Get.lazyPut, Get.create, Get.asyncPut
                // Get.find<InjectionController>();
                // Get.putAsync
                Get.find<InjectionController>().increament();
              },
              child: const Text('Injection'),
            )
          ],
        ),
      ),
    );
  }
}
