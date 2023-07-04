import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/u_marketplace_controller.dart';
import 'package:playbox/partials/fa_marketplace/switch_user.dart';
import 'package:playbox/partials/u_marketplace/card_filter.dart';
import 'package:playbox/partials/u_marketplace/recommendation.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:sizer/sizer.dart';

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
                    Text(
                      "Toko",
                      style: body1TextStyle(
                        weight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(Icons.settings_outlined),
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(Icons.notifications_outlined),
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(Icons.chat_outlined),
                          ),
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
              SwitchUser(isFarmer: false),
              SizedBox(height: 16),
              CardFilter(),
              SizedBox(height: 20),
              Recommendation(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
