import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'forgotPassPage.dart';


class LoginPage extends StatefulWidget{
  final VoidCallback showSignupPage;

  const LoginPage({Key? key,required this.showSignupPage}):super(key: key);
  
  @override
  State<LoginPage> createState()=>_LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async{
   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
  Fluttertoast.showToast(
        msg: 'Please fill in all fields.');
  return;
}

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
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim());
      Navigator.pop(context);}
      on FirebaseAuthException catch(e){
        Navigator.pop(context);
       errorMessage(e.code);
        }
      }
  

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Colors.green,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }



  @override
  void dispose(){
    _emailController.dispose();
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
              "You've been missed!",
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
             const SizedBox(height :50),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                controller: _emailController,
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

                GestureDetector(
                  
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password?',
                        style: const TextStyle(color: Colors.red,
                        decoration: TextDecoration.underline),
                        )
                      ]
                    ),
                   ),
                   onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const forgotPass(),
                   )),
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
                    children:  [
                      Text(
                        'Not a member?',
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.showSignupPage,
                        child: Text('Create an account',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  )
          ],
          ),
        )
        ),
        )
    );
  }
}