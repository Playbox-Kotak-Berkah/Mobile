import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/edit_profile_controller.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/widgets/custom_appbar.dart';
import 'package:sizer/sizer.dart';
import 'package:playbox/widgets/app_textfield.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(controller.profile.value?.name);
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(
                    () {
                      if (controller.profile.value == null ||
                          controller.profile.value!.picture == "") {
                        return ClipRRect(
                          child: Image.asset(
                            "assets/images/default_pp.png",
                            width: 30.w,
                            height: 30.w,
                            fit: BoxFit.fill,
                          ),
                        );
                      } else {
                        return ClipRRect(
                          child: Image.network(
                            controller.profile.value!.picture,
                            width: 30.w,
                            height: 30.w,
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        print('cok');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorConstants.slate[600],
                        ),
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.brush,
                          color: ColorConstants.slate[200],
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Obx(
              () => AppTextfield(
                label: "Nama",
                controller: TextEditingController(
                    text: controller.profile.value?.name ?? ""),
                placeholder: "",
                readOnly: true,
              ),
            ),
            SizedBox(height: 12),
            Obx(
              () => AppTextfield(
                label: "Email",
                controller: TextEditingController(
                    text: controller.profile.value?.email ?? ""),
                placeholder: "",
                readOnly: true,
              ),
            ),
            SizedBox(height: 12),
            Obx(
              () => AppTextfield(
                label: "Nomor Telepon",
                controller: TextEditingController(
                    text: controller.profile.value?.phone ?? ""),
                readOnly: true,
                placeholder: "",
              ),
            ),
            AppTextfield(
              label: "Nomor Telepon",
              controller: TextEditingController(text: "Pas dahskd "),
              readOnly: true,
              placeholder: "",
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
