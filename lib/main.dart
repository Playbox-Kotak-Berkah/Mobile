import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:playbox/routes/app_page.dart';
import 'package:playbox/routes/app_route.dart';
import 'package:playbox/utils/global_bindings.dart';
import 'package:playbox/utils/global_theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          initialBinding: GlobalBinding(),
          title: 'Playbox APP',
          theme: globalTheme(),
          getPages: appPage(),
          initialRoute: AppRoute.splash,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
