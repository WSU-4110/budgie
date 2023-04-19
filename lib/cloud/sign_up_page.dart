import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget{
  final VoidCallback showLoginPage;

  const SignUpPage({Key? key,required this.showLoginPage}):super(key: key);
  
  @override
  State<SignUpPage> createState()=>_SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage>{

  final _emailContoller = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController= TextEditingController();

  Future<void> addUsertoStore(String userEmail) async{
    CollectionReference users =FirebaseFirestore.instance.collection('users');
    FirebaseAuth auth =FirebaseAuth.instance;
    String uid =auth.currentUser!.uid.toString();
    users.add({
      'userEmail':userEmail, 'uid': uid 

    });
    return;
  }


  void signUp() async{
   if (_emailContoller.text.isEmpty || _passwordController.text.isEmpty) {
  Fluttertoast.showToast(
        msg: 'Please fill in all fields.');
  return;
}
 RegExp emailPatt =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(_emailContoller.text.trim().isNotEmpty&&!emailPatt.hasMatch(_emailContoller.text)){
      Fluttertoast.showToast(msg:'Please enter a valid email address');
    }

if (_passwordController.text.length < 8) {
    Fluttertoast.showToast(
        msg: 'Password must be at least 8 characters');
  return;
}
if (_passwordController.text != _confirmController.text) {
    Fluttertoast.showToast(
        msg: 'Passwords do not match');
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
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailContoller.text.trim(), 
      password: _passwordController.text.trim()
      );
      addUsertoStore(_emailContoller.text);
       Navigator.pop(context);
  }
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
    _emailContoller.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child:TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: _confirmController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: 'Confirm Password',
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
                    onTap: signUp,
                    child: Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('Sign up',
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
                        'Already a member?',
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text('Sign in',
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
        )) ,)
    );
  }
}