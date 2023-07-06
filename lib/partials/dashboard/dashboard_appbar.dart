import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/global_controller.dart';
import 'package:playbox/utils/text_styles.dart';

class DashboardAppbar extends StatefulWidget {
  const DashboardAppbar({super.key});

  @override
  State<DashboardAppbar> createState() => _DashboardAppbarState();
}

class _DashboardAppbarState extends State<DashboardAppbar> {
  GlobalController globalController = GlobalController.i;

  @override
  void initState() {
    super.initState();
    globalController.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.asset(
                  "assets/images/default_pp.png",
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Selamat Pagi,"),
                    SizedBox(height: 2),
                    Obx(
                      () => Text(
                        globalController.profile.value?.name ?? "",
                        style: h3TextStyle(weight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
