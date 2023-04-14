import 'package:budgie/cloud/login_page.dart';
import 'package:budgie/cloud/sign_up_page.dart';
import 'package:flutter/material.dart';
class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool showLoginPage=true;

  void toggle(){
    setState(() {
      showLoginPage= !showLoginPage;
    
    });

  }

  @override

  Widget build(BuildContext context) {
   if (showLoginPage){
    return LoginPage(showSignupPage: toggle );
   }
   else{
    return SignUpPage(showLoginPage: toggle);
   }
  }
}