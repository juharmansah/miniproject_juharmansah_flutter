import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:pemesanan_tiket_pemancingan/ViewModels/repository.dart';

// Create a class for your user data
class UserData extends ChangeNotifier {
  // Define any properties you need, for example:
  String username = '';
  String password = '';

  // Add methods to update the data
  void updateUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Wrap your MaterialApp with ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Consumer<UserData>(
              builder: (context, userData, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onChanged: (value) {
                        // Update the username in the provider
                        userData.updateUsername(value);
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      onChanged: (value) {
                        // Update the password in the provider
                        userData.updatePassword(value);
                      },
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/daftar');
                      },
                      child: Text('buat akun baru'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String username = userData.username;
                        String password = userData.password;

                        if (username.isNotEmpty && password.isNotEmpty) {
                          print('Login berhasil');

                          final user =
                              await FirebaseRepository().getUser(username, password);
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                              context,
                              '/berita',
                              arguments: user,
                            );
                          }
                        } else {
                          print('Username dan password tidak boleh kosong');
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
