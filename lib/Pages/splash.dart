import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'; // Import flutter_native_splash

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    /// whenever your initialization is completed, remove the splash screen:
    Future.delayed(const Duration(seconds: 1)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      body: Center(
        child: Text(
          "WELCOME HOME",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 27),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}



