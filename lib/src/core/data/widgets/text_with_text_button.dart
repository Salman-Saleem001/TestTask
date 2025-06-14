import 'package:bloc_demo/main_export.dart';

class TextWithTextButton extends StatelessWidget {
  const TextWithTextButton({super.key, required this.text, required this.buttonText, required this.onPressed});

  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: text, fontSize: 16, textColor: AppColors.greyColor3),
        28.wp(),
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.buttonColor.withValues(alpha: 0.3); // your custom splash
              }
              return null;
            }),
          ),
          child: CustomText(
            text: buttonText,
            fontSize: 16,
            textColor: AppColors.buttonColor,
            fontFamily: Assets.ebGaramondSemiBold,
          ),
        ),
      ],
    );
  }
}
