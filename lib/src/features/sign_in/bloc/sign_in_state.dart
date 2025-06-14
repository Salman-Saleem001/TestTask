import 'package:bloc_demo/main_export.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isValid;
  final bool isSubmitting;
  final bool showPassword;
  final String? error;

  const SignInState({
    required this.email,
    required this.password,
    this.isValid = false,
    this.isSubmitting = false,
    this.showPassword =  false,
    this.error,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isValid,
    bool? isSubmitting,
    bool? showPassword,
    String? error,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showPassword: showPassword?? this.showPassword,
      error: error,
    );
  }

  @override
  List<Object?> get props => [email, password, isValid, isSubmitting, error, showPassword];
}
