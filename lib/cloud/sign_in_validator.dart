
class MyValidator{
  static String emailValidator(final String value){
    String message='';
    if(value.trim().isEmpty)message='Please enter an email';
    RegExp emailPatt =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(value.trim().isNotEmpty&&!emailPatt.hasMatch(value)){
      message='Please enter a valid email address';
    }
    if(emailPatt.hasMatch(value)){
      message='Valid email';
    }
    return message;
  }
static String passValidator(final String input){
  String message='';
  if(input.trim().isEmpty)message='Please enter a password';
  if(input.trim().isNotEmpty&&input.length<8){
    message='Password must be at least 8 characters';
  }
  if(input.trim().isNotEmpty&&input.length>7){
    message='Valid password';
  }
  return message;
}


}