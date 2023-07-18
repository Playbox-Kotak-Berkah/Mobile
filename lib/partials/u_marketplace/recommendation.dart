import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/u_marketplace_controller.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/partials/u_marketplace/card_product.dart';
import 'package:playbox/utils/text_styles.dart';

class Recommendation extends GetView<UserMarketplaceController> {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.products);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Rekomendasi",
          style: body4TextStyle(
            weight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Obx(
          () => GridView.count(
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 0.67,
            children: controller.products
                .map((element) => CardProduct(data: element))
                .toList(),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
