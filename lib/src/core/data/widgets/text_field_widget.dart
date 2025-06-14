import 'package:bloc_demo/main_export.dart';

class SignInTextField extends StatelessWidget {
  const SignInTextField({
    super.key,
    this.labelText,
    this.isPassword,
    this.isHidden = false, this.onSuffixPressed,
    this.onChanged,
  });

  final String? labelText;
  final bool? isPassword;
  final bool isHidden;
  final VoidCallback? onSuffixPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: AppColors.buttonColor,
      obscureText: isHidden,
      style: TextStyle(color: AppColors.greyColor1, fontSize: 16, fontFamily: Assets.latoRegular),
      decoration: InputDecoration(
        labelText: labelText ?? "Email",
        labelStyle: TextStyle(color: AppColors.greyColor3, fontSize: 14, fontFamily: Assets.latoRegular),
        floatingLabelStyle: TextStyle(color: AppColors.buttonColor, fontSize: 12, fontFamily: Assets.latoRegular),
        focusColor: AppColors.buttonColor,
        suffixIcon:
        isPassword != null
            ? InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onSuffixPressed,
              child: Icon(
                        isHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: AppColors.buttonColor,
                        size: 24,
                      ),
            )
            : null,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.buttonColor, width: 0.5)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.buttonColor, width: 0.5)),
      ),
    );
  }
}