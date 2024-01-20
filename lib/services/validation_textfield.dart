
class Validation {

  static String? name(String? value){
    RegExp nameRegExp = RegExp(r'^[A-Z][a-zA-Z]* [A-Z][a-zA-Z]*$');
    if (value == null || value.isEmpty) {
      return 'enter name';
    }
    if (!nameRegExp.hasMatch(value)) {
      return 'Invalid name exp "Souley Diom"';
    }
    return null;
  }

  
  static String? email(String? value){
    final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (value == null || value.isEmpty) {
      return 'enter email';
    }
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? password(String? value){
    RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$'
    );
    if (value == null || value.isEmpty) {
      return 'Enter a text';
    }
    if (!passwordRegExp.hasMatch(value)) {
      return 'Invalid Password';
    }
    return null;
  }

  static String? confirmPassWord({String? value, String? password}){
    if (value == null || value.isEmpty) {
      return 'Confirm password';
    }
    if (password != value) {
      return "Password doesn't match";
    }
    return null;
  }
}
