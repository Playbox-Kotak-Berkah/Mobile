import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/global_controller.dart';
import 'package:playbox/app/controller/profile_controller.dart';
import 'package:playbox/partials/profile/about_profile.dart';
import 'package:playbox/partials/profile/account_settings.dart';
import 'package:playbox/partials/profile/help_center.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/services/api/api_utils.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_bottombar.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalController globalController = GlobalController.i;
  ProfileController controller = ProfileController.i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100.w, 70),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: h2TextStyle(
                        weight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.profileEdit);
                      },
                      child: Text(
                        "Edit my profile",
                        style: body5TextStyle(
                          decoration: TextDecoration.underline,
                          color: ColorConstants.slate[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/default_pp.png",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          globalController.profile.value?.name ?? "",
                          style: h4TextStyle(
                            weight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "+6281234123",
                          style: body6TextStyle(
                            color: ColorConstants.slate[400],
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstants.primary[600],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "Aqua Farmers",
                                  style: body6TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "Verified",
                                  style: body6TextStyle(
                                    color: ColorConstants.slate[50],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: ColorConstants.primary[500],
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Positioned(
                      left: -30,
                      top: -10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(140),
                        child: Container(
                          width: 140,
                          height: 140,
                          color: ColorConstants.primary[300],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: ColorConstants.primary[200],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.membership);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Buy your membership!",
                              style: body4TextStyle(
                                color: Colors.white,
                                weight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              AccountSettings(),
              SizedBox(height: 16),
              HelpCenter(),
              SizedBox(height: 16),
              AboutProfile(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ApiUtils.logout();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.error,
                ),
                child: Text("Logout"),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
