import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
              color: Color(0xFF3CC56B),
            ),

            child: Image.asset('assets/logo.png', height: 200)),
          
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                context, '/berita',
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text("Berita")),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                context, '/tiket',
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text("Tiket")),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                context, '/chatbot',
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),          
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(child: Text("ChatBot")),
            ),
          ),
          ],
        ),
      );
      
  }
}