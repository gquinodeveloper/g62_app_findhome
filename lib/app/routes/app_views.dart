import 'package:g62_find_home/app/routes/routes_name.dart';
import 'package:g62_find_home/app/ui/views/detail/detail_binding.dart';
import 'package:g62_find_home/app/ui/views/detail/detail_view.dart';
import 'package:g62_find_home/app/ui/views/home/home_binding.dart';
import 'package:g62_find_home/app/ui/views/home/home_view.dart';
import 'package:g62_find_home/app/ui/views/login/login_binding.dart';
import 'package:g62_find_home/app/ui/views/login/login_view.dart';
import 'package:g62_find_home/app/ui/views/register/register_binding.dart';
import 'package:g62_find_home/app/ui/views/register/register_view.dart';
import 'package:g62_find_home/app/ui/views/splash/splash_binding.dart';
import 'package:g62_find_home/app/ui/views/splash/splash_view.dart';
import 'package:get/get.dart';

abstract class AppViews {
  static final getViews = [
    GetPage(
      name: RoutesName.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesName.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesName.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RoutesName.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
