import 'package:get/get.dart';
import 'package:getx_flutter/GetxServices/service.dart';

Future<void> initServices() async {
  print('injection depency');
  Get.putAsync(() async => await Service().increament());
}
