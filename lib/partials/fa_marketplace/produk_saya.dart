import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/partials/fa_marketplace/card_seller.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class ProdukSaya extends GetView<FarmerMarketplaceController> {
  const ProdukSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Produk Saya",
          style: body4TextStyle(
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          width: 100.w,
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          primary: true,
          childAspectRatio: 0.73,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            CardSeller(
              data: ProductModel(
                image: "assets/images/udang_dogol.png",
                name: "Udang Dogol",
                price: 12500,
                rating: 4.7,
                sold: 120,
              ),
            ),
            CardSeller(
              data: ProductModel(
                image: "assets/images/udang_jerbung.png",
                name: "Udang Jerbung",
                price: 13500,
                rating: 4.1,
                sold: 90,
              ),
            ),
            CardSeller(
              data: ProductModel(
                image: "assets/images/udang_vaname.png",
                name: "Udang Vaname",
                price: 14000,
                rating: 4.3,
                sold: 117,
              ),
            ),
            CardSeller(
              data: ProductModel(
                image: "assets/images/udang_windu.png",
                name: "Udang Windu",
                price: 15000,
                rating: 4.6,
                sold: 110,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
