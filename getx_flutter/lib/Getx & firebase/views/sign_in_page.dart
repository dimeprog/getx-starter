import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/forget_password_page.dart';
import 'package:getx_flutter/Getx%20&%20firebase/views/sign_up.dart';

import '../../main.dart';
import '../utils/rounded_elevated_button.dart';
import '../utils/rounded_textfield.dart';
import '../utils/text&textbutton.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  // text copntroller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // key
  final _formKey = GlobalKey<FormState>();
  // controller
  AuthController _authController = Get.put(AuthController());

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
        backgroundColor: const Color(0xff370926),
      ),
      backgroundColor: Colors.pink.withOpacity(0.4),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(getHeight(15)),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/login_pic.png',
                      width: getWidth(200),
                      height: getHeight(200),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(20),
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
                    height: getHeight(20),
                  ),
                  RoundedTextField(
                    key: const ValueKey(3),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Get.to(() => ForgetPasswordPage());
                        },
                        child: Text(
                          'Forget password',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: getHeight(18),
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                  RoundedElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        _authController.signIn(email, password);

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
                    title: 'Login',
                    padding: EdgeInsets.symmetric(
                      vertical: getHeight(10),
                      horizontal: getWidth(30),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(5),
                  ),
                  TextAndTextButton(
                    text: 'I dont have an account?',
                    textButtonTitle: 'Sign up',
                    onPressed: () {
                      Get.offAll(() => SignUpPage());
                    },
                  ),
                  SizedBox(height: getHeight(20)),
                  Image.asset('assets/signin_google.png'),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  SizedBox(
                    width: getWidth(150),
                    child: RoundedElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _authController.googleSignInUser();

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
                      title: 'Sign in with Google',
                      padding: EdgeInsets.symmetric(
                        vertical: getHeight(10),
                        horizontal: getWidth(30),
                      ),
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
