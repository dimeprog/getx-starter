import 'package:get/get.dart';
import 'package:getx_flutter/GetxServices/service.dart';

class InitialBinging implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(() => Service());
  }
}
