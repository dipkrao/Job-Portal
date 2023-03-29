import 'package:get/get.dart';
import 'package:starter/app/modules/auth/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:starter/app/modules/auth/forgotpassword/views/forgotpassword_view.dart';
import 'package:starter/app/modules/auth/login/bindings/login_binding.dart';
import 'package:starter/app/modules/auth/login/views/login_view.dart';
import 'package:starter/app/modules/auth/signup/bindings/signup_binding.dart';
import 'package:starter/app/modules/auth/signup/views/signup_view.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/spalsh/bindings/spalsh_binding.dart';
import '../modules/spalsh/views/spalsh_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPALSH,
      page: () => const SpalshView(),
      binding: SpalshBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.FORGOTPASSWORD,
      page: () => const ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
