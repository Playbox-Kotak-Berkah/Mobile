import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/u_marketplace_controller.dart';
import 'package:playbox/partials/u_marketplace/card_filter.dart';
import 'package:playbox/partials/u_marketplace/recommendation.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserMarketplacePage extends GetView<UserMarketplaceController> {
  const UserMarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100.w, 75),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/logo/logo_marketplace.svg"),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        SizedBox(width: 4),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(Icons.chat),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Cari Udang Vaname Segar",
                  hintStyle: body5TextStyle(
                    weight: FontWeight.w500,
                    color: ColorConstants.slate[400],
                  ),
                ),
              ),
              SizedBox(height: 16),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Image.asset("assets/images/banner.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Image.asset("assets/images/banner.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Image.asset("assets/images/banner.png"),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  padEnds: false,
                  height: 140,
                  viewportFraction: 0.9,
                ),
              ),
              SizedBox(height: 8),
              CardFilter(),
              SizedBox(height: 8),
              Recommendation(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
