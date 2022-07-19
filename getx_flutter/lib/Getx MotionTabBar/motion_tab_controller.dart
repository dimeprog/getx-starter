import 'package:get/get.dart';

class MotionTabController extends GetxController {
  var index = 0.obs;
  void setIndex(val) {
    index.value = val;
  }

  int getIndex() => index.value;
}
