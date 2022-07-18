import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InjectionController extends GetxController {
  void increament() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int counter = (sp.getInt('Counter') ?? 0) + 1;
    print(counter);
    await sp.setInt('counter', counter);
  }
}
