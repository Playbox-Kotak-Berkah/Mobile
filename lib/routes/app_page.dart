import 'package:get/get.dart';
import 'package:playbox/app/bindings/dashboard_bindings.dart';
import 'package:playbox/app/bindings/fa_marketplace_bindings.dart';
import 'package:playbox/app/bindings/kontrol_bindings.dart';
import 'package:playbox/app/bindings/login_bindings.dart';
import 'package:playbox/app/bindings/onboarding_bindings.dart';
import 'package:playbox/app/bindings/profile_bindings.dart';
import 'package:playbox/app/bindings/register_bindings.dart';
import 'package:playbox/app/bindings/u_marketplace_bindings.dart';
import 'package:playbox/app/view/dashboard_screen.dart';
import 'package:playbox/app/view/fa_marketplace_screen.dart';
import 'package:playbox/app/view/kontrol_screen.dart';
import 'package:playbox/app/view/login_screen.dart';
import 'package:playbox/app/view/onboarding_screen.dart';
import 'package:playbox/app/view/profile_screen.dart';
import 'package:playbox/app/view/register_screen.dart';
import 'package:playbox/app/view/splash_screen.dart';
import 'package:playbox/app/view/u_marketplace_screen.dart';
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
    GetPage(
      name: AppRoute.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoute.kontrol,
      page: () => KontrolPage(),
      binding: KontrolBinding(),
    ),
    GetPage(
      name: AppRoute.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoute.farmerMarketplace,
      page: () => FarmerMarketplacePage(),
      binding: FarmerMarketplaceBinding(),
    ),
    GetPage(
      name: AppRoute.customerMarketplace,
      page: () => UserMarketplacePage(),
      binding: UserMarketplaceBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
