import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemesanan_tiket_pemancingan/ViewModels/repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
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
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/daftar');
            }, child: Text('buat akun baru')),
            ElevatedButton(
              onPressed: () async {
                // Implementasi logika login di sini
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Contoh sederhana, cek apakah username dan password kosong
                if (username.isNotEmpty && password.isNotEmpty) {
                  // Lakukan aksi login yang sesuai
                  print('Login berhasil');

                  final user =
                      await FirebaseRepository().getUser(username, password);
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/berita');
                  }
                } else {
                  // Tampilkan pesan kesalahan jika username atau password kosong
                  print('Username dan password tidak boleh kosong');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
