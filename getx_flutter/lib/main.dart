import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/GetX%20stateManagent/reactive.dart';
import 'package:getx_flutter/Getx%20Route/named_route.dart';
import 'package:getx_flutter/Getx%20Route/pages/homepage.dart';
import 'package:getx_flutter/show%20snackbar%20dialogbox,%20bottomsheet/show_snackBar.dart';

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
      home: Reactive(),
    );
  }
}
