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

  void signIn() async{
    showDialog(
      context:context,
      builder:(context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailContoller.text.trim(), 
      password: _passwordController.text.trim());
      Navigator.pop(context);}
      on FirebaseAuthException catch(e){
        Navigator.pop(context);
        if (e.code=='user-not-found') {
          wrongEmailMessage();
        }
        else if (e.code=='wrong-password'){
          wrongPasswordMessage();
        }

      }


  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

   void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }



  @override
  void dispose(){
    _emailContoller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
         //  backgroundColor: Color.fromARGB(255, 0, 158, 48),

      body: SafeArea(child:
      Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Budgie!',
              style: GoogleFonts.bebasNeue(fontSize:52, color:Colors.green)
            ),
             const SizedBox(height: 10),
             const Text(
              'Your personal budget buddy!',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
             const SizedBox(height :50),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: _emailContoller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
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
                  style: const TextStyle(color: Colors.black),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
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
                        color: Colors.green,
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
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Create an account',
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