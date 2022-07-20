import 'package:get/get.dart';

class ShimmerController extends GetxController {
  final _isLoading = true.obs;
  bool getIsLoading() => _isLoading.value;
  void swap() => _isLoading.value = !_isLoading.value;
}
