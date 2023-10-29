import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3), 
      () => Navigator.pushReplacementNamed(context, '/login')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Container(
              width: double.infinity, 
              height: double.infinity, 
              color: Color(0xFF3CC56B),
            ),
            Center(
              child: ClipOval(
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ],
      
    );
  }
}


