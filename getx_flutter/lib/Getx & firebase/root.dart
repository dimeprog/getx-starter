// ignore_for_file: unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/home_page.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/sign_in_page.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/sign_up.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff370926),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return SafeArea(
            child: FirebaseAuth.instance.currentUser != null ||
                    controller.isSignIn == true
                ? HomePage()
                : SignInPage(),
          );
        },
      ),
    );
  }
}
