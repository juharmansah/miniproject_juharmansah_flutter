import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemesanan Berhasil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Pemesanan Berhasil!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Terima kasih telah memesan tiket.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman sebelumnya atau halaman lainnya
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
