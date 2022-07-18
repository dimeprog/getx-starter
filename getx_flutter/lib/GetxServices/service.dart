import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service extends GetxService {
  loading() {
    print('depency loaded');
  }

  Future<void> increament() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int counter = (sp.getInt('Counter') ?? 0) + 1;
    print(counter);
    await sp.setInt('counter', counter);
  }
}
