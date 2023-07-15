import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source, imageQuality: 30);

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

Future<List<File>> pickMultiImage({int max = 100}) async {
  final ImagePicker picker = ImagePicker();
  final pickedFile = await picker.pickMultiImage(imageQuality: 30);

  if (pickedFile.isNotEmpty) {
    List<File> parsePicked = <File>[];
    int counter = 0;
    for (int i = 0; (i < pickedFile.length && counter < max); i++, counter++) {
      parsePicked.add(
        File(
          pickedFile[i].path,
        ),
      );
    }

    return parsePicked;
  }
  return <File>[];
}
