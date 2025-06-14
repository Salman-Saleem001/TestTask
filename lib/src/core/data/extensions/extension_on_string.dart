
extension ExtensionOnString on String{

  bool validateEmail() {
    return !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~^-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(this);
  }

  bool validatePassword() {
    return !RegExp(r'^(?!.*\s)(?=.*?[A-Z])(?=.*?[0-9!@#$%^&*]).{8,}$').hasMatch(this);
  }

}