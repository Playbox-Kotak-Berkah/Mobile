import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/fa_marketplace_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class StatusPenjualan extends GetView<FarmerMarketplaceController> {
  const StatusPenjualan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Status Penjualan",
              style: body4TextStyle(
                weight: FontWeight.w600,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Lihat Riwayat",
                  style: body6TextStyle(
                    color: ColorConstants.slate[400],
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.chevron_right,
                  size: 14,
                  color: ColorConstants.slate[400],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "10",
                    style: body1TextStyle(
                      color: ColorConstants.primary[500],
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Perlu Dikirim",
                    style: body6TextStyle(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "10",
                    style: body1TextStyle(
                      color: ColorConstants.primary[500],
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Pembatalan",
                    style: body6TextStyle(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "10",
                    style: body1TextStyle(
                      color: ColorConstants.primary[500],
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Pengembalian",
                    style: body6TextStyle(),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 86,
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/icons/box_product.svg"),
                      SizedBox(height: 6),
                      Text(
                        "Produk",
                        style: body6TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 86,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/wallet.svg"),
                      SizedBox(height: 6),
                      Text(
                        "Keuangan",
                        style: body6TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 86,
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/icons/shop_outline.svg"),
                      SizedBox(height: 6),
                      Text(
                        "Promosi Toko",
                        style: body6TextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
