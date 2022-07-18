import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var imageFilePath = ''.obs;
  var imageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    // ImagePicker _imagePicker = ImagePicker();
    var pickedImage = await ImagePicker().pickImage(source: imageSource);
    if (pickedImage != null) {
      imageFilePath.value = pickedImage.path;
      imageSize.value =
          (File(pickedImage.path).lengthSync()).toStringAsFixed(2) + 'Mb';
    } else {
      Get.snackbar(
        'No image selected',
        'No image was select by the camera',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blueGrey,
        colorText: Colors.white,
      );
    }
  }
}
