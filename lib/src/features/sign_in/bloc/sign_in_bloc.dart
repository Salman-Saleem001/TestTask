import 'package:bloc_demo/main_export.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState(email: '', password: '')) {
    on<EmailChanged>(_emailChange);
    on<PasswordChanged>(_passwordChange);
    on<SubmitSignIn>(_onSubmit);
    on<ShowPassword>(_showPassword);
  }

  FutureOr<void> _emailChange(event, emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordChange(event, emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onSubmit(event, emit) async {
    emit(state.copyWith(isSubmitting: true, error: null));
    if (!_validate(state.email, state.password)) {
      emit(state.copyWith(isSubmitting: false, error: "Please enter email and password"));
      return;
    }
    await Future.delayed(const Duration(seconds: 1));
    if (state.email.validateEmail()) {
      emit(state.copyWith(isSubmitting: false, error: "Invalid email"));
      return;
    }

    if (state.password.validatePassword()) {
      emit(
        state.copyWith(
          isSubmitting: false,
          error:
              "Password must be at least 8 characters and contain at least one number and one special character and one uppercase letter",
        ),
      );
      return;
    }

    emit(state.copyWith(isValid: true, isSubmitting: false, error: null));
  }

  FutureOr<void> _showPassword(ShowPassword event, Emitter<SignInState> emit) {
    emit(state.copyWith(showPassword: event.showPassword));
  }

  bool _validate(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
