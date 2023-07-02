import 'package:get/get.dart';
import 'package:playbox/app/bindings/login_bindings.dart';
import 'package:playbox/app/bindings/onboarding_bindings.dart';
import 'package:playbox/app/bindings/register_bindings.dart';
import 'package:playbox/app/view/login_screen.dart';
import 'package:playbox/app/view/onboarding_screen.dart';
import 'package:playbox/app/view/register_screen.dart';
import 'package:playbox/app/view/splash_screen.dart';
import 'package:playbox/routes/app_route.dart';

List<GetPage<dynamic>> appPage() {
  return <GetPage<dynamic>>[
    GetPage(
      name: AppRoute.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoute.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
