import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/cloud/sign_in_validator.dart';

void main(){
  test('empty email test',(){
  String result=MyValidator.emailValidator('');
  expect(result, 'Please enter an email');
});


test('invalid email test',(){
  String result=MyValidator.emailValidator('value');
  expect(result, 'Please enter a valid email address');
});

test('valid email test',(){
  String result=MyValidator.emailValidator('alagbari321@gmail.com');
  expect(result, 'Valid email');
});

test('empty password test', (){
String result=MyValidator.passValidator('');
expect(result, 'Please enter a password');
});

test('invalid password test', (){
  String result=MyValidator.passValidator('input');
  expect(result,'Password must be at least 8 characters');
});

test('valid password test', (){
  String result=MyValidator.passValidator('password123');
  expect(result,'Valid password');
});


}