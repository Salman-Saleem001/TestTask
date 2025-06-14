import 'package:bloc_demo/main_export.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    this.textColor,
    this.fontFamily,
    this.maxLines,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final String? fontFamily;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor ?? AppColors.greyColor1,
        inherit: false,
        fontFamily: fontFamily ?? Assets.latoRegular,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
