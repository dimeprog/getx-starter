import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/Getx%20MotionTabBar/motion_tab_controller.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class MotionTabBarScreen extends StatelessWidget {
  MotionTabController controller = Get.put(MotionTabController());
  Widget buildReUsedContainer(
    String pageTitle,
    Color color,
  ) =>
      Container(
        color: color,
        child: Center(
          child: Text(
            pageTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.getIndex() == 0
            ? buildReUsedContainer('DashBoard', Colors.blueGrey)
            : controller.getIndex() == 1
                ? buildReUsedContainer('chit chat', Colors.teal)
                : buildReUsedContainer('Delete', Colors.amber),
      ),
      bottomNavigationBar: MotionTabBar(
        tabBarColor: Colors.white,
        initialSelectedTab: 'DashBoard',
        labels: const [
          'DashBoard',
          'chit chat',
          'Delete',
        ],
        icons: const [
          Icons.dashboard,
          Icons.chat_bubble,
          Icons.check,
        ],
        tabSelectedColor: Colors.purple,
        onTabItemSelected: (val) {
          controller.setIndex(val);
        },
      ),
    );
  }
}
