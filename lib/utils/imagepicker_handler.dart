import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

Future<File> getImage({required String url}) async {
  /// Get Image from server
  final Response res = await Dio().get<List<int>>(
    url,
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  /// Get App local storage
  final Directory appDir = await getApplicationDocumentsDirectory();

  /// Generate Image Name
  final String imageName = url.split('/').last;

  /// Create Empty File in app dir & fill with new image
  final File file = File(join(appDir.path, imageName));

  file.writeAsBytesSync(res.data as List<int>);

  return file;
}
