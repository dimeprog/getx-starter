import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/GetX%20stateManagent/reactive.dart';
import 'package:getx_flutter/Getx%20MotionTabBar/motion_tab_bar.dart';
import 'package:getx_flutter/Getx%20Route/named_route.dart';
import 'package:getx_flutter/Getx%20Route/pages/homepage.dart';
import 'package:getx_flutter/Getx%20imagePicker/imagePicker_screen.dart';
import 'package:getx_flutter/Getx%20imagePicker/imagePicker_screen.dart';
import 'package:getx_flutter/GetxServices/service.dart';
import 'package:getx_flutter/GetxServices/servicePage.dart';
import 'package:getx_flutter/GexBindings/initial_bindings.dart';
import 'package:getx_flutter/dependency%20injection/injection.dart';
import 'package:getx_flutter/shimmer%20effect/shimmer_effect_screen.dart';
import 'package:getx_flutter/show%20snackbar%20dialogbox,%20bottomsheet/show_snackBar.dart';

import 'GetxServices/init_function.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX_Starter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBinging(),
      home: ShimmerEffectScreen(),
      getPages: [
        GetPage(name: '/homePage', page: () => HomePage()),
        GetPage(name: '/showsnack', page: () => ShowSnackBar()),
      ],
    );
  }
}
