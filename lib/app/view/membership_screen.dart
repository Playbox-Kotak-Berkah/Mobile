import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.slate[25],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SvgPicture.asset(
                "assets/logo/logo_no_text.svg",
              ),
              SizedBox(height: 8),
              Text(
                "Pilih Paket Bulanan Anda",
                style: body2TextStyle(
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              // 3 BULAN
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3 Bulan",
                      style: body4TextStyle(
                        weight: FontWeight.bold,
                        color: ColorConstants.slate[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "Rp. 2.500.000,-",
                          style: body3TextStyle(
                            weight: FontWeight.w800,
                            color: ColorConstants.primary[500],
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          "/bln",
                          style: body5TextStyle(
                            color: ColorConstants.slate[700],
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorConstants.slate[300],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Dukungan perangkat selama 3 bulan",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Bebas Konsultasi",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Promosi hingga 5 produk",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Pilih Paket"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // 6 BULAN
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "6 Bulan",
                      style: body4TextStyle(
                        weight: FontWeight.bold,
                        color: ColorConstants.slate[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "Rp. 2.350.000,-",
                          style: body3TextStyle(
                            weight: FontWeight.w800,
                            color: ColorConstants.primary[500],
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          "/bln",
                          style: body5TextStyle(
                            color: ColorConstants.slate[700],
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorConstants.slate[300],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Dukungan perangkat selama 6 bulan",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Bebas Konsultasi",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Promosi hingga 10 produk",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Pilih Paket"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // 1 TAHUN
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "1 Tahun",
                          style: body4TextStyle(
                            weight: FontWeight.bold,
                            color: ColorConstants.slate[700],
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstants.primary[500],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "Pilihan Terbaik!",
                            style: body6TextStyle(
                              weight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "Rp. 2.100.000,-",
                          style: body3TextStyle(
                            weight: FontWeight.w800,
                            color: ColorConstants.primary[500],
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          "/bln",
                          style: body5TextStyle(
                            color: ColorConstants.slate[700],
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorConstants.slate[300],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Dukungan perangkat selama 12 bulan",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Bebas konsultasi",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/check-circle.svg"),
                        SizedBox(width: 4),
                        Text(
                          "Promosi hingga 20 produk",
                          style: body6TextStyle(
                            color: ColorConstants.slate[700],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Pilih Paket"),
                    ),
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
