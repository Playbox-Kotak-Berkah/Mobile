import 'package:flutter/material.dart';
import 'package:playbox/app/models/product/product_model.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/format_currency.dart';
import 'package:playbox/utils/text_styles.dart';

class CardProduct extends StatelessWidget {
  final ProductModel data;
  const CardProduct({super.key, required this.data});

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
              child: Image.network(
                data.photo,
                width: 110,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            data.name,
            style: body5TextStyle(
              weight: FontWeight.bold,
              color: ColorConstants.slate[700],
            ),
          ),
          SizedBox(height: 2),
          Text(
            formatCurrency(data.price),
            style: body6TextStyle(
              color: ColorConstants.primary[500],
              weight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[500],
                size: 12,
              ),
              Text(
                data.rating.toStringAsFixed(2),
                style: body6TextStyle(),
              ),
              SizedBox(width: 4),
              Text(
                "${data.sold} Terjual",
                style: body6TextStyle(
                  color: ColorConstants.slate[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
