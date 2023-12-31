import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/login_controller.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Form(
            key: controller.formKey,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/bg_auth.png",
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
                Container(
                  height: 100.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 50),
                          SvgPicture.asset(
                              "assets/logo/logo_text_white_horizontal.svg"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang Kembali!',
                            style: body2TextStyle(
                              color: ColorConstants.slate[25],
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            label: 'Email',
                            controller: controller.form['email']!,
                            placeholder: "Masukkan email anda disini",
                            labelColor: ColorConstants.slate[100],
                            validator: controller.emailValidator,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 18,
                            ),
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            label: 'Password',
                            controller: controller.form['password']!,
                            placeholder: "Minimal 8 Karater",
                            labelColor: ColorConstants.slate[100],
                            obscureText: true,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 18,
                            ),
                            validator: controller.passwordValidator,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: controller.login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstants.primary[400],
                            ),
                            child: Text("LOGIN"),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Belum memiliki akun? ",
                                style: body5TextStyle(
                                  color: ColorConstants.slate[100],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoute.register);
                                },
                                child: Text(
                                  "Register",
                                  style: body5TextStyle(
                                    color: ColorConstants.slate[50],
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
