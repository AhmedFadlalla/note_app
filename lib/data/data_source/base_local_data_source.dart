import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class BaseLocalDataSource{

  Future<File> getImage();
}
class LocalDataSource extends BaseLocalDataSource{
  @override
  Future<File> getImage() async {
    ImagePicker picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);

      return File(file!.path);

  }


  }



