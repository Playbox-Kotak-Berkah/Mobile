import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/add_product_controller.dart';
import 'package:playbox/partials/add_product/insert_image.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:playbox/widgets/custom_appbar.dart';

class AddProductPage extends GetView<AddProductController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Tambah Produk"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InsertImage(),
                SizedBox(height: 16),
                AppTextfield(
                  label: "Nama Produk",
                  controller: controller.form['name']!,
                  placeholder: "Nama Produk Anda",
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Nama produk tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                AppTextfield(
                  label: "Harga Produk",
                  controller: controller.form['price']!,
                  keyboardType: TextInputType.number,
                  placeholder: "20.000",
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rp',
                        style: body6TextStyle(),
                      ),
                    ],
                  ),
                  validator: (e) {
                    if (e!.isEmpty) {
                      return "Harga produk tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.submit,
                  child: Text("INPUT"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
