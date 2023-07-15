import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide MultipartFile hide FormData;
import 'package:image_picker/image_picker.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/services/api/api_utils.dart';
import 'package:playbox/services/api/fetch_data.dart';
import 'package:playbox/services/api/request_method.dart';
import 'package:playbox/utils/form_converter.dart';
import 'package:playbox/utils/imagepicker_handler.dart';

class EditProductController extends GetxController {
  static EditProductController get i => Get.find();

  Rxn<ProductModel> product = Rxn<ProductModel>();

  RxMap<String, TextEditingController> form = <String, TextEditingController>{
    "name": TextEditingController(),
    "price": TextEditingController(),
  }.obs;

  var formKey = GlobalKey<FormState>();
  Rxn<File> image = Rxn<File>();

  @override
  void onInit() async {
    super.onInit();
    final controller = FarmerMarketplaceController.i;
    final id = Get.parameters['id']!;
    getDetailProduct(id);

    var list =
        controller.myProducts.where((e) => e.id == int.parse(id)).toList();
    if (list.isNotEmpty) {
      product.value = list[0];
      if (product.value != null) {
        assignJson();
        image.value = await getImage(url: product.value!.photo);
      }
    }
  }

  void assignJson() {
    form['name']!.text = product.value!.name;
    form['price']!.text = "${product.value!.price}";
  }

  void getDetailProduct(String id) async {
    var response = await fetchData<ProductModel>(
      url: "/api/market-farmer/products/$id",
      method: RequestMethod.GET,
    );

    if (response != null) {
      product.value = response.data;
      if (product.value != null) {
        assignJson();
        image.value = await getImage(url: product.value!.photo);
      }
    }
  }

  void pickImageProduct() async {
    final pickedImage = await pickImage(ImageSource.gallery);
    if (pickedImage != null) {
      image.value = pickedImage;
    }
  }

  void submit() async {
    final id = Get.parameters['id']!;
    if (image.value == null) {
      ApiUtils.showAlert("Gambar produk tidak boleh kosong");
      return;
    }
    if (formKey.currentState!.validate()) {
      final data = formConverter(form);
      data['photo'] = MultipartFile.fromBytes(
        await image.value!.readAsBytes(),
        filename: image.value!.path,
      );
      final formData = FormData.fromMap(data);
      var response = await fetchData<ProductModel>(
        url: "/api/market-farmer/update/$id",
        method: RequestMethod.PATCH,
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

  void delete() async {
    final id = Get.parameters['id']!;
    var response = await fetchData<ProductModel>(
      url: "/api/market-farmer/delete/$id",
      method: RequestMethod.DELETE,
    );

    if (response != null) {
      FarmerMarketplaceController controller = FarmerMarketplaceController.i;
      controller.getAllProduct();
      ApiUtils.showAlert(
        "Berhasil menghapus data",
        isSuccess: true,
      );
      Get.back();
    }
  }
}
