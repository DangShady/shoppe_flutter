import 'dart:io';

import 'package:ai_chat_flutter/constants/image_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  List<Map<String, dynamic>> listGeneral = [
    {
      "title": "Personal Info",
      "icon": ImageConstant.profile,
      "subTitle": "",
    },
    {
      "title": "Security",
      "icon": ImageConstant.security,
      "subTitle": "",
    },
    {
      "title": "Language",
      "subTitle": "English (US)",
      "icon": ImageConstant.document,
    },
  ];
  List<Map<String, dynamic>> listAbout = [
    {
      "title": "Help Center",
      "icon": ImageConstant.paper,
    },
    {
      "title": "Privacy Policy",
      "icon": ImageConstant.lock,
    },
    {
      "title": "About ChattyAI",
      "icon": ImageConstant.infoSquare,
    },
    {
      "title": "Logout",
      "icon": ImageConstant.logOut,
    },
  ];
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print('no Images Selected');
  }

  File? selectedImage;
  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);

      print('Selected Image: $selectedImage');
    } else {
      print('No Images Select');
    }
  }
}
