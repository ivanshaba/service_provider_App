//checks if already logged in and starts at either login or at the home page
//also changes page if logged in 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Pages/home_page.dart';
import 'package:service_app/Pages/Do%20Not%20Change/login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Homepage(); // Update this line to navigate to 'NewExtraPage'
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
