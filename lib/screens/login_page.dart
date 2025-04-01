// screens/login_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart'; // Import untuk navigasi ke MainApp
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {  // _login adlaha nama fungsi (ada "_" karena aturan dari bahasa dart)
    try {
      // Proses login dengan Firebase Authentication
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigasi ke halaman utama (MainApp) setelah berhasil login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainApp()),
      );
    } on FirebaseAuthException catch (e) {
      String message = 'Login gagal!';
      if (e.code == 'user-not-found') {
        message = 'Pengguna tidak ditemukan. Silakan daftar terlebih dahulu.';
      } else if (e.code == 'wrong-password') {
        message = 'Password salah. Silakan coba lagi.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Aplikasi
            Center(
              child: Image.asset(
                'lib/assets/logo.png',
                height: 200,
              ),
            ),
            SizedBox(height: 20),

            // Judul
            Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:Colors.blueAccent
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Silakan masuk untuk melanjutkan.',
              style: TextStyle(fontSize: 16, 
              color: Colors.blueAccent),
            ),
            SizedBox(height: 30),

            // Input Email
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Input Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Tombol Login
            ElevatedButton(
              onPressed: () => _login(context), // manggil fungsi _login
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),

            // Navigasi ke Register Page
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                'Belum punya akun? Daftar di sini.',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
