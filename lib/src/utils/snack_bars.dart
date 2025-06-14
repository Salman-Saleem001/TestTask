import 'package:bloc_demo/main_export.dart';

class CustomSnackBar {
  static final CustomSnackBar _instance = CustomSnackBar._init();
  CustomSnackBar._init();
  factory CustomSnackBar() => _instance;

  SnackBar showSnackBar({required String text, Color? backgroundColor, Color? textColor}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor ?? AppColors.buttonColor,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      content: CustomText(text: text, fontSize: 14, textColor: textColor ?? AppColors.greyScaleColor, maxLines: 2),
    );
  }
}
