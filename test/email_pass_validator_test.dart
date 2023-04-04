import 'package:flutter_test/flutter_test.dart';
import 'package:budgie/cloud/sign_in_validator.dart';

void main(){
  test('empty email test',(){
  String result=MyValidator.emailValidator('');
  expect(result, 'Please enter  email');
});

}