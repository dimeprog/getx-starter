import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/GetX%20stateManagent/user.dart';

class ObxWithCustomClass extends StatelessWidget {
  var user = User(age: 21, name: 'Dime dush').obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obx with custom class'),
      ),
      body: SafeArea(
        child: Obx(() {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My Name is ${user.value.name} '),
                Text('My Age is ${user.value.age}'),
                ElevatedButton(
                  onPressed: () {
                    user.update((val) {
                      user.value.name = val!.name.toLowerCase();
                    });
                  },
                  child: Text('toLowercase'),
                ),
                ElevatedButton(
                  onPressed: () {
                    user.update((val) {
                      user.value.name = val!.name.toUpperCase();
                    });
                  },
                  child: Text('to Uppercase'),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
