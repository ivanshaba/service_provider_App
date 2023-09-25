
//Used to Create an account 
// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Components/button.dart';
import '../../Components/auth_services.dart';
import '../../Components/square_tile.dart';
import 'package:service_app/Components/my_textfield.dart';




class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
  class _RegisterPageState extends State<RegisterPage>{

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPass = TextEditingController();

  void signUserUp() async{

    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
      } 
    ); 

  try{
    if(passwordController.text == confirmPass.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text
      );
    }
    else{
      showError("Passwords do not match.");
    }
      
    // ignore: use_build_context_synchronously
    Navigator.pop(context);  
  } on FirebaseAuthException catch(e){
    // ignore: use_build_context_synchronously
    Navigator.pop(context);  
    showError(e.code);
  }
  }
  void showError(String texts){
    showDialog(context: context, builder: (context){
        return  AlertDialog(
        backgroundColor: Colors.red,
        
        title: Text(
          texts,
          style: const TextStyle(
            color: Colors.white
          ),
          )
        
        
        );
    });
  }
  
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.grey[350],
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(children:[
        
          //Logo will be inserted here 
            const SizedBox(height: 20),
            const Icon(
              Icons.construction,
              color: Colors.black,
              size: 150.0,
            ),
          // Company Name will be here, it will have to be updated in the future
            const SizedBox(height: 60),
        
            const Center(
              child: Text(
                "Create a New Account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
        
                ),
                ),
            ),
        
                MyTextField(
                  controller: usernameController,
                  hintText: 'Email',
                  obscureText: false,
                ),
        
                const SizedBox(height: 10),
        
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                MyTextField(
                  controller: confirmPass,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
           
             
                const SizedBox(height: 5),
              
                
               
                const SizedBox(height: 10),
             MyButton(
              onTap: signUserUp,
              text: "Sign Up",
            ),
                 const SizedBox(height: 10),        // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
        
             const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    
                      SquareTile(
                        onTap: ()=> auth_services().signInWithGoogle(),
                        imagePath: 'lib/images/2.png'
                      )
                  ],
                ),
            const SizedBox(height: 20),
           GestureDetector(
            onTap: widget.onTap,
             child: Center(
              child: Text(
              "Already have an account? Login now!" ,
             style: TextStyle(
              color: Colors.blueAccent.shade700
              ),
                     ),
                ),
           )
          ]
          ),
        ),
      ),
    );

  }
  
}