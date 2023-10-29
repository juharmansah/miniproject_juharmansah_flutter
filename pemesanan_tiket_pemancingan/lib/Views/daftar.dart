import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_tiket_pemancingan/ViewModels/repository.dart';

class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _konfirmasipasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _konfirmasipasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'konfirmasi Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Implementasi logika login di sini
                String username = _usernameController.text;
                String password = _passwordController.text;
                String konfirmasipassword = _konfirmasipasswordController.text;

                // Contoh sederhana, cek apakah username dan password kosong
                if (username.isNotEmpty &&
                    password.isNotEmpty &&
                    konfirmasipassword.isNotEmpty) {
                  if (password == konfirmasipassword) {
                    try {
                      await FirebaseFirestore.instance.collection("users").add({
                        "username": username,
                        "password": password,
                      });
                    } on FirebaseException catch (e) {
                      print(e.message.toString());
                    }

                    Navigator.pushReplacementNamed(context, '/berita');
                  }
                } else {
                  // Tampilkan pesan kesalahan jika username atau password kosong
                  print('Username dan password tidak boleh kosong');
                }
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
