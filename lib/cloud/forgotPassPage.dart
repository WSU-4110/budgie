import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class forgotPass extends StatefulWidget {
  const forgotPass({super.key});

  @override
  State<forgotPass> createState() => _forgotPass();
}

class _forgotPass extends State<forgotPass> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  
  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context)=> Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

  appBar: AppBar(
    title: Text('Reset Password'),
  ),
  body: Padding(padding: EdgeInsets.all(16),
  child: Form(key: formKey,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Enter your email address to reset your password.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
      SizedBox(height: 20,),
      TextField(
                style: const TextStyle(color: Colors.black),
                controller: emailController,
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
              const SizedBox(height:10),

                
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: resetPass,
                    child: Container(
                      padding:const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('Send Email',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      )),
                      ),
                  )
                  ),
    ]
    ),
    ),
    )

    
);
Future resetPass() async{
    showDialog(
      context:context,
      builder:(context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
Fluttertoast.showToast(msg: "Password Reset Email has been sent");
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

  
}