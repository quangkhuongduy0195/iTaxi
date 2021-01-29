
class Validator {
  static bool validName(String name){
    return name != null && name.length > 0;
  }

  static bool validPhone(String phone){
    return phone != null && phone.length >= 9 && phone.length <= 11 && double.parse(phone, (e) => null) != null;
  }

  static bool validEmail(String email){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool validPassword(String password){
    return password != null && password.length > 6;
  }
}