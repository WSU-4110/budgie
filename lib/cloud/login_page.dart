import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}):super(key: key);
  
  @override
  State<LoginPage> createState()=>_LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  final _emailContoller = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailContoller.text.trim(), 
      password: _passwordController.text.trim());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22C55E),
      body: SafeArea(child:
      Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Budgie!',
              style: GoogleFonts.bebasNeue(fontSize:52,)
            ),
             SizedBox(height: 10),
             Text(
              'Your personal budget buddy!',
              style: TextStyle(fontSize: 18,),
            ),
             SizedBox(height :50),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreenAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                ),
              ),
              ),
              SizedBox(height: 10),
              Padding(padding: )
          ],
          ),
        )) ,)
    )
  }
}