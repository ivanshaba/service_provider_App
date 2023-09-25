// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:helpmandu/Pages/account_page.dart';
// import 'package:helpmandu/Pages/home_page.dart';
// import 'package:helpmandu/Pages/splash.dart';
// // import 'package:flutter_native_splash/flutter_native_splash.dart'; // Import flutter_native_splash

// // import 'Pages/Do Not Change/auth_page.dart';
// import 'firebase_options.dart';

// void main () async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     name: 'construction',
//   options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override 
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: const Homepage(),
//       initialRoute: '/',
//       routes: {
//                 '/account': (context) => const Homepage(),
//       },
//     );

//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageState createState() => _MyHomePageState();
// }



// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 2), () {
//       // After a delay, navigate to the login page
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const Homepage()),
//       );
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Splash(),
//     );
//   }
// }



// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:service_app/Pages/account_page.dart';
import 'package:service_app/Pages/home_page.dart';
import 'package:service_app/Pages/splash.dart';
import 'package:service_app/firebase_options.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart'; /




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp(
    name: 'construction',
  options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget  build(BuildContext context) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // After a delay, navigate to the login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Splash(),
    );
  }
}


