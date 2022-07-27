import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/config.dart';
import 'package:getx_flutter/Getx%20&%20firebase/controllers/auth_controller.dart';
import 'package:getx_flutter/Getx%20&%20firebase/utils/rounded_elevated_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  Home view',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xff370926),
      ),
      backgroundColor: Colors.pink.withOpacity(0.1),
      body: Column(
        children: [
          Image.asset(
            'assets/welcome.jpg',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: getWidth(30),
          ),
          GetBuilder<AuthController>(
            builder: (controller) {
              return Center(
                child: Column(
                  children: [
                    controller.displayProfilePhoto == ''
                        ? Image.asset(
                            'assets/avatar.jpg',
                            fit: BoxFit.cover,
                            height: getHeight(160),
                            width: getWidth(160),
                          )
                        : Image.network(
                            controller.displayProfilePhoto,
                            fit: BoxFit.cover,
                            height: getHeight(200),
                            width: getWidth(160),
                          ),
                    SizedBox(
                      height: getHeight(30),
                    ),
                    Text(
                      controller.displayName,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: getHeight(30),
          ),
          Center(
            child: SizedBox(
              width: getWidth(100),
              child: RoundedElevatedButton(
                onPressed: () {
                  Get.find<AuthController>().signOut();
                  Get.back();
                },
                title: 'Sign Out',
                padding: EdgeInsets.symmetric(vertical: getHeight(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
