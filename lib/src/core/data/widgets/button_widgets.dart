import 'package:bloc_demo/main_export.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, required this.onPressed, this.padding, this.margin});

  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: AppColors.buttonColor),
        padding: padding ?? EdgeInsets.symmetric(vertical: 16),
        margin: margin,
        child: child,
      ),
    );
  }
}