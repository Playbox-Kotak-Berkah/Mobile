import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:playbox/app/controller/register_controller.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';
import 'package:playbox/widgets/app_textfield.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/bg_auth.png",
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 100.w,
                  constraints: BoxConstraints(minHeight: 100.h),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 30),
                          SvgPicture.asset(
                              "assets/logo/logo_text_white_horizontal.svg"),
                        ],
                      ),
                      SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang Aqua Farmers!',
                            style: body2TextStyle(
                              color: ColorConstants.slate[25],
                              weight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            validator: controller.nameValidator,
                            label: "Nama",
                            controller: controller.form['name']!,
                            placeholder: "Masukkan nama anda disini",
                            labelColor: ColorConstants.slate[100],
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            label: 'Email',
                            controller: controller.form['email']!,
                            placeholder: "Masukkan email anda disini",
                            labelColor: ColorConstants.slate[100],
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.emailValidator,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 18,
                            ),
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            keyboardType: TextInputType.number,
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 18,
                            ),
                            label: "Nomor Telepon",
                            controller: controller.form['phone']!,
                            placeholder: "ex: 81312341234",
                            labelColor: ColorConstants.slate[100],
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            obscureText: true,
                            label: 'Password',
                            controller: controller.form['password']!,
                            placeholder: "Minimal 8 Karater",
                            labelColor: ColorConstants.slate[100],
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 18,
                            ),
                            validator: controller.passwordValidator,
                          ),
                          SizedBox(height: 16),
                          AppTextfield(
                            obscureText: true,
                            label: 'Konfirmasi Password',
                            controller: controller.form['confirm_password']!,
                            placeholder: "Minimal 8 Karater",
                            labelColor: ColorConstants.slate[100],
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 18,
                            ),
                            validator: controller.confirmPasswordValidator,
                          ),
                          SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => Checkbox(
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(
                                        width: 1.0, color: Colors.white),
                                  ),
                                  value: controller.isAgree.value,
                                  onChanged: (e) {
                                    controller.isAgree.value = e!;
                                  },
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Dengan ini saya menyetujui segala kebijakan dan ketentuan yang telah ditentukan oleh perusahaan.",
                                  textAlign: TextAlign.justify,
                                  style: body5TextStyle(
                                    color: ColorConstants.slate[100],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.isAgree.value
                              ? controller.register
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.primary[400],
                          ),
                          child: Text("REGISTER"),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah memiliki akun? ",
                            style: body5TextStyle(
                              color: ColorConstants.slate[100],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoute.login);
                            },
                            child: Text(
                              "Login",
                              style: body5TextStyle(
                                color: ColorConstants.slate[50],
                                weight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
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
