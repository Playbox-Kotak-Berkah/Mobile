import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile hide FormData;
import 'package:image_picker/image_picker.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/services/api/api_utils.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';
import 'package:playbox/utils/form_converter.dart';
import 'package:playbox/utils/imagepicker_handler.dart';

class AddProductController extends GetxController {
  static AddProductController get i => Get.find();

  RxMap<String, TextEditingController> form = <String, TextEditingController>{
    "name": TextEditingController(),
    "price": TextEditingController(),
  }.obs;

  var formKey = GlobalKey<FormState>();

  Rxn<File> image = Rxn<File>();

  void pickImageProduct() async {
    final pickedImage = await pickImage(ImageSource.gallery);
    if (pickedImage != null) {
      image.value = pickedImage;
    }
  }

  void submit() async {
    if (image.value == null) {
      ApiUtils.showAlert("Gambar produk tidak boleh kosong");
    }
    if (formKey.currentState!.validate()) {
      final data = formConverter(form);
      data['photo'] = MultipartFile.fromBytes(
        await image.value!.readAsBytes(),
        filename: image.value!.path,
      );
      final formData = FormData.fromMap(data);
      var response = await fetchData<ProductModel>(
        url: "/api/market-farmer/add",
        method: RequestMethod.POST,
        data: formData,
      );
      if (response != null) {
        FarmerMarketplaceController farmerMarketplaceController =
            FarmerMarketplaceController.i;
        farmerMarketplaceController.getAllProduct();
        ApiUtils.showAlert("Produk berhasil ditambahkan", isSuccess: true);
        Get.back();
      }
    }
  }
}
