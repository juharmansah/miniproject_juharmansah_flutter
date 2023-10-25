import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}

class AuthService {
  Future<User?> login(String username, String password) async {
    
    final String apiUrl = 'https://65335062d80bd20280f66220.mockapi.io/';
    
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'username': username, 'password': password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}

class AuthNotifier extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  void login(String username, String password) async {
    final AuthService authService = AuthService();
    final User? user = await authService.login(username, password);

    if (user != null) {
      this.user = user;
    } else {
      throw Exception('Login failed');
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthNotifier(),
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String username = _usernameController.text;
                final String password = _passwordController.text;

                // Gunakan provider untuk memanggil metode login
                Provider.of<AuthNotifier>(context, listen: false)
                    .login(username, password);
              },
              child: Text('Login'),
            ),
            Consumer<AuthNotifier>(
              builder: (context, auth, child) {
                if (auth.user != null) {
                  return Text('Logged in as ${auth.user!.username}');
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
