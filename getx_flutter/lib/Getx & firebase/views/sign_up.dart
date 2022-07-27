import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';
import 'package:getx_flutter/Getx%20&%20firebase/utils/rounded_elevated_button.dart';
import 'package:getx_flutter/Getx%20&%20firebase/utils/rounded_textfield.dart';
import 'package:getx_flutter/Getx%20&%20firebase/utils/text&textbutton.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/home_page.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/sign_in_page.dart';

import '../../main.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  // text controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  // controllers
  AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign in view',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xff370926),
      ),
      backgroundColor: Colors.pink.withOpacity(0.4),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/signup_pic.png',
                      height: getHeight(150),
                      width: getWidth(100),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    RoundedTextField(
                      key: ValueKey(1),
                      controller: _nameController,
                      hintText: 'Name',
                      validator: (val) {
                        if (val.toString().length < 4) {
                          return 'name should more than 4 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    RoundedTextField(
                      key: ValueKey(2),
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
                      height: getHeight(20),
                    ),
                    RoundedTextField(
                      key: ValueKey(3),
                      controller: _passwordController,
                      obsecure: true,
                      hintText: ' Password',
                      validator: (val) {
                        if (val.toString().length < 6) {
                          return 'Password should more than 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    RoundedTextField(
                      key: ValueKey(4),
                      controller: _confirmPasswordController,
                      obsecure: true,
                      hintText: '  Confirm Password',
                      validator: (val) {
                        if (val.trim() != _passwordController.text.trim()) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    RoundedElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String name = _nameController.text.trim();
                          String email = _emailController.text.trim();
                          String password = _passwordController.text.trim();
                          _authController.signUp(name, email, password);

                          Get.snackbar(
                            'sucessful',
                            'Congratulations ...',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            snackStyle: SnackStyle.FLOATING,
                          );
                        } else {
                          Get.snackbar(
                            'unsucessful',
                            'check your details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                            snackStyle: SnackStyle.FLOATING,
                          );
                        }
                      },
                      title: 'Sign Up',
                      padding: EdgeInsets.symmetric(
                        vertical: getHeight(10),
                        horizontal: getWidth(30),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(5),
                    ),
                    TextAndTextButton(
                      text: 'Already have an account?',
                      textButtonTitle: 'Login',
                      onPressed: () {
                        Get.offAll(() => SignInPage());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
