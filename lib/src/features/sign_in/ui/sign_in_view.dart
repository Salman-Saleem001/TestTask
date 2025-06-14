import 'package:bloc_demo/main_export.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocListener<SignInBloc, SignInState>(
        listener: (BuildContext context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar().showSnackBar(text: state.error ?? ''));
          }
          if (state.isValid && !state.isSubmitting && state.error == null) {
            debugPrint("Login successful");
            context.read<CollectionBloc>().add(GetCollection());
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomView()));
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 80.0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back, color: AppColors.greyColor1, size: 24),
              ),
              40.hp(),
              CustomText(text: 'Sign In', fontSize: 32, fontFamily: Assets.ebGaramondMedium),
              40.hp(),
              SignInTextField(
                onChanged: (value) {
                  context.read<SignInBloc>().add(EmailChanged(value));
                },
              ),
              20.hp(),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  return SignInTextField(
                    labelText: "Password",
                    isPassword: true,
                    isHidden: !state.showPassword,
                    onChanged: (val) {
                      context.read<SignInBloc>().add(PasswordChanged(val));
                    },
                    onSuffixPressed: () {
                      context.read<SignInBloc>().add(ShowPassword(!state.showPassword));
                    },
                  );
                },
              ),
              50.hp(),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (BuildContext context, state) {
                  return CustomButton(
                    child:
                        state.isSubmitting
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: const CircularProgressIndicator(
                                color: AppColors.backgroundColor,
                                strokeWidth: 2.0,
                              ),
                            )
                            : CustomText(
                              text: "Continue",
                              fontSize: 16,
                              textColor: AppColors.greyScaleColor,
                              fontFamily: Assets.ebGaramondMedium,
                            ),
                    onPressed: () {
                      if(!state.isSubmitting){
                        context.read<SignInBloc>().add(SubmitSignIn());
                      }
                    },
                  );
                },
              ),

              50.hp(),
              TextWithTextButton(text: 'Can’t sign in?', buttonText: 'Recover password', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
