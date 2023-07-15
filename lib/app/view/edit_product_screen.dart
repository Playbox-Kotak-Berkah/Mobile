import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/edit_product_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:playbox/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class EditProductPage extends GetView<EditProductController> {
  const EditProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Produk"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Insert Image",
                  style: body5TextStyle(
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  child: Obx(
                    () => controller.image.value == null
                        ? GestureDetector(
                            onTap: controller.pickImageProduct,
                            child: DottedBorder(
                              color: ColorConstants.slate[300]!,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10),
                              dashPattern: [6, 6],
                              child: SizedBox(
                                width: 100.w,
                                height: 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/add.svg",
                                      width: 35,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "Insert your image product",
                                      style: body6TextStyle(
                                        color: ColorConstants.slate[400],
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      controller.image.value!,
                                      width: 100.w,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.image.value = null;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: ColorConstants.slate[800],
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: ColorConstants.slate[200],
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                controller.image.value!.path,
                                style: body6TextStyle(
                                  size: 10,
                                  color: ColorConstants.slate[400],
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                  ),
                ),
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
                  child: Text("EDIT"),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.error,
                  ),
                  onPressed: controller.delete,
                  child: Text("DELETE"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
