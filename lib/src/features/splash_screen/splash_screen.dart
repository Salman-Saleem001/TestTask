import 'package:bloc_demo/main_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  late ValueNotifier<bool> _showImage;
  @override
  void initState() {
    super.initState();
    _showImage = ValueNotifier(true);
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1250));
    _slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 1250));
    _showImage.value = false;
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        image: DecorationImage(image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(_fadeController),
              child: Image.asset(Assets.splashImage, scale: 2.0),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _showImage,
            builder: (BuildContext context, bool value, Widget? child) {
              if (!value) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 34),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.containerColor),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: 'Welcome!', fontSize: 32, fontFamily: Assets.ebGaramondMedium),
                        16.hp(),
                        CustomText(text: "Get Your Bottle", fontSize: 16),
                        CustomButton(
                          onPressed: () {},
                          margin: EdgeInsets.symmetric(vertical: 24),
                          child: CustomText(
                            text: "Scan bottle",
                            fontSize: 16,
                            fontFamily: Assets.ebGaramondSemiBold,
                            textColor: AppColors.greyScaleColor,
                          ),
                        ),
                        TextWithTextButton(
                          text: "Have an account?",
                          buttonText: "Sign in first",
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInView()));
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _showImage.dispose();
    super.dispose();
  }
}


