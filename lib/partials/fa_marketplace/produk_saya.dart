import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';
import 'package:playbox/partials/fa_marketplace/card_seller.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/no_data.dart';
import 'package:sizer/sizer.dart';

class ProdukSaya extends GetView<FarmerMarketplaceController> {
  const ProdukSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Produk Saya",
              style: body4TextStyle(
                weight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoute.yourProduct);
              },
              child: Text(
                'Edit Produk',
                style: body6TextStyle(
                  color: ColorConstants.primary[500],
                  weight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          width: 100.w,
        ),
        Obx(
          () => controller.myProducts.isEmpty
              ? SizedBox(
                  height: 30.h,
                  child: NoData(
                    onPressed: () {},
                    text: "Tambak Produk Anda",
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
                        .map((e) => CardSeller(data: e))
                        .toList(),
                  ],
                ),
        )
      ],
    );
  }
}
