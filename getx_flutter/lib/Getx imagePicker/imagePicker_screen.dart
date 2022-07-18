import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_flutter/Getx%20imagePicker/imageController.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraPageScreen extends StatelessWidget {
  CameraPageScreen({Key? key}) : super(key: key);

  ImageController controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 194, 114),
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 500,
                width: double.maxFinite,
                child: controller.imageFilePath == ''
                    ? const Center(
                        child: Text('No image taking yet'),
                      )
                    : Image.file(
                        File(controller.imageFilePath.value),
                        fit: BoxFit.fill,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: Text('Camera'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text('Select from Gallery'),
              )
            ],
          );
        }),
      ),
    );
  }
}
