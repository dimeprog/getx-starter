import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/shimmer%20effect/shimmer._controller.dart';
import 'package:getx_flutter/shimmer%20effect/shimmer_listview.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectScreen extends StatelessWidget {
  ShimmerController controller = Get.put(ShimmerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: 700,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  return Shimmer.fromColors(
                    enabled: controller.getIsLoading(),
                    baseColor: Colors.amber,
                    highlightColor: Colors.grey,
                    child: const Expanded(
                      child: ShimmerListview(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return ElevatedButton(
          onPressed: () => controller.swap(),
          child: Text(controller.getIsLoading() ? 'pause' : 'play'),
        );
      }),
    );
  }
}
