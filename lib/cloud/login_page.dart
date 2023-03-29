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
         //  backgroundColor: Color.fromARGB(255, 0, 158, 48),

      body: SafeArea(child:
      Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Budgie!',
              style: GoogleFonts.bebasNeue(fontSize:52, color:Colors.white)
            ),
             const SizedBox(height: 10),
             const Text(
              'Your personal budget buddy!',
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
             const SizedBox(height :50),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailContoller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(color:Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child:TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color:Colors.grey),
                    fillColor: Colors.white,
                    filled:true,
                    
                  ),
                  obscureText: true,)
                ),
                const SizedBox(height:10),
                
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('Sign in',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      )),
                      ),
                  )
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Register here',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ],
                  )
          ],
          ),
        )) ,)
    );
  }
}