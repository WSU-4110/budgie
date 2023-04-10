import 'package:budgie/cloud/authpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return const MainScreen();
          }

          else{
            return const Authpage();
          }
        } ),
    );
  }
}

class Authenticator{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  User? get currentUser=>_firebaseAuth.currentUser;

  Stream<User?> get authStateChanges=>_firebaseAuth.authStateChanges();
}