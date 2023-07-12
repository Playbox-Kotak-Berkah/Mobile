import 'package:flutter/material.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/format_currency.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:sizer/sizer.dart';

class CardSeller extends StatelessWidget {
  final ProductModel data;
  const CardSeller({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                data.image,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            data.name,
            style: body5TextStyle(
              weight: FontWeight.bold,
            ),
          ),
          Text(
            formatCurrency(data.price),
            style: body6TextStyle(
              color: ColorConstants.slate[400],
            ),
          ),
          SizedBox(height: 10),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              side: BorderSide(
                width: 1,
                color: ColorConstants.primary[500]!,
              ),
            ),
            onPressed: () {},
            child: Text(
              "Naikkan Produk",
              style: body6TextStyle(
                color: ColorConstants.primary[500],
                weight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
