import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/GetX%20stateManagent/GetX_controller.dart';

class StateWithController extends StatelessWidget {
  const StateWithController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('state management with getx controller'),
      ),
      body: SafeArea(
        child: GetX<CountController>(
            init: CountController(),
            builder: (controller) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.increament,
                      child: Icon(Icons.add),
                    ),
                    Text(
                      'The value is ${controller.count.value}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: controller.decreament,
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
