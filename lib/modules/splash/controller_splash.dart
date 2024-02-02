part of "./splash.dart";

class SplashController extends GetxController {
  Future<void> initData() async {
    loadingNextRoute();
  }

  Future<void> loadingNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    Routes.routeOff(type: "contact");
  }
}
