abstract class SignInEvent {}

class EmailChanged extends SignInEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends SignInEvent {
  final String password;
  PasswordChanged(this.password);
}

class ShowPassword extends SignInEvent {
  final bool showPassword;
  ShowPassword(this.showPassword);
}

class SubmitSignIn extends SignInEvent {}
