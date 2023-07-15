import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';
import 'package:playbox/partials/fa_marketplace/card_seller.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/widgets/custom_appbar.dart';
import 'package:playbox/widgets/no_data.dart';
import 'package:sizer/sizer.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  FarmerMarketplaceController controller = FarmerMarketplaceController.i;

  @override
  void initState() {
    super.initState();
    controller.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Produk",
        action: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.addProduct);
          },
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: ColorConstants.primary[400],
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.add,
              color: ColorConstants.slate[100],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(
                () => controller.myProducts.isEmpty
                    ? SizedBox(
                        height: 80.h,
                        child: NoData(
                          action: "Tambah Produk",
                          text: "Anda belum menjual produk apapun",
                          onPressed: () {},
                        ),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        primary: true,
                        childAspectRatio: 0.67,
                        scrollDirection: Axis.vertical,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          ...controller.myProducts
                              .map(
                                (e) => CardSeller(
                                  data: e,
                                  onPressed: () {},
                                  actionText: 'Edit Produk',
                                ),
                              )
                              .toList(),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
