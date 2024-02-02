part of "./splash.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  @override
  void initState() {
    controller.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      type: "default",
      colorBackground: Utility.baseColor3,
      colorSafeArea: Utility.baseColor3,
      returnOnWillpop: false,
      content: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 3,
              color: Utility.baseColor1,
            ),
            SizedBox(
              height: Utility.verySmall,
            ),
            TextLabel(
              text: "Loading...",
              color: Utility.baseColor1,
            )
          ],
        ),
      ),
    );
  }
}
