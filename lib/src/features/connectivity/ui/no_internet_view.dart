import 'package:bloc_demo/main_export.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        elevation: 2.0,
        surfaceTintColor: AppColors.containerColor,
        backgroundColor: AppColors.containerColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.signal_wifi_connected_no_internet_4,size: 32,color: AppColors.buttonColor,),
              15.hp(),
              CustomText(text: "No Internet!", fontSize: 16, fontFamily: Assets.ebGaramondMedium,),
              10.hp(),
              CustomText(text: 'Please check your internet connection and try again.', fontSize: 14),
            ],
          ),
        ),
      ),
    );
  }
}
