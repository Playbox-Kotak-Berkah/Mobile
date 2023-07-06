import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class RegisterModal extends StatelessWidget {
  const RegisterModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: ColorConstants.slate[25],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Ingin bergabung sebagai apa?",
            style: h2TextStyle(
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 32),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoute.register);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Aqua Farmers",
                          style: h2TextStyle(
                            color: ColorConstants.primary[500],
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Kelola tambak, pantau perkembangan, dan jual melalui marketplace.",
                          style: body6TextStyle(
                            color: ColorConstants.slate[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Icon(
                    Icons.chevron_right,
                    color: ColorConstants.slate[200],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoute.register);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Customers",
                          style: h2TextStyle(
                            color: ColorConstants.primary[500],
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Pembelian udang segar langsung dari tambaknya.",
                          style: body6TextStyle(
                            color: ColorConstants.slate[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Icon(
                    Icons.chevron_right,
                    color: ColorConstants.slate[200],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
