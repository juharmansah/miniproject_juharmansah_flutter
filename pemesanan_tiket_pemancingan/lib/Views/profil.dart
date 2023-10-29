import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pemesanan_tiket_pemancingan/ViewModels/repository.dart';

import '../Models/user_model.dart';


class ProfilePage extends StatelessWidget {
  UserModel getUser(BuildContext context){
    
    final UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
   return user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                'https://example.com/path/to/profile_picture.jpg',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Nama Anda',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email Anda',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: ()async {
                await FirebaseFirestore.instance.collection('users').doc(getUser(context).id).delete();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
