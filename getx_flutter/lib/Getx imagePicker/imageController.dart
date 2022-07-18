import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class ImageCOntroller extends GetxController {
  var imageFile = ''.obs;

  void getImage(ImageSource imageSource) async {
    ImagePicker _imagePicker = ImagePicker();
    var image = await _imagePicker.pickImage(source: imageSource);
  }
}
