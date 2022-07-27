import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';

import '../../main.dart';
import '../utils/rounded_elevated_button.dart';
import '../utils/rounded_textfield.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);
  // text controller
  TextEditingController _emailController = TextEditingController();
  //  controller
  AuthController _authController = Get.find<AuthController>();
// key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.withOpacity(0.4),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(getHeight(15)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  const Text(
                    'If you wish to recover your password, then enter your email in the form below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  Image.asset(
                    'assets/forgetpass.png',
                    width: getHeight(350),
                  ),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  RoundedTextField(
                    key: const ValueKey(2),
                    controller: _emailController,
                    hintText: 'Email',
                    validator: (val) {
                      bool correctMail = RegExp(regExpression).hasMatch(val);
                      if (!correctMail) {
                        return 'name should more than 4 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  RoundedElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text.trim();

                        _authController.resetPassword(email);

                        Get.snackbar(
                          'sucessful',
                          'Congratulations ...',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.withOpacity(0.5),
                          colorText: Colors.white,
                          snackStyle: SnackStyle.FLOATING,
                        );
                      } else {
                        Get.snackbar(
                          'unsucessful',
                          'check your details',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.withOpacity(0.5),
                          colorText: Colors.white,
                          snackStyle: SnackStyle.FLOATING,
                        );
                      }
                    },
                    title: 'Send Link',
                    padding: EdgeInsets.symmetric(
                      vertical: getHeight(10),
                      horizontal: getWidth(30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
