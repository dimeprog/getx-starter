import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0.obs;
  void increament() => count.value++;
  void decreament() => count--;
}
