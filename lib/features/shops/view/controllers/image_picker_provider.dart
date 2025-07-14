import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerWidget extends ChangeNotifier {
  File? image;

  getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    image = File(photo!.path);
    notifyListeners();
  }

  getImageFromLocal() async {
    final ImagePicker picker = ImagePicker();
    final XFile? localPhoto = await picker.pickImage(source: ImageSource.gallery);
    image = File(localPhoto!.path);
    notifyListeners();
  }
}
