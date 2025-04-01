// screens/profil_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser; // Data pengguna

    return Scaffold(
      backgroundColor: Colors.grey[200], // Background warna abu-abu muda
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // Judul "Profil" dengan font estetik
              Center(
                child: Text(
                  'Profil Pengguna',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat', // Font estetik
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Avatar untuk Profil
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.green[100],
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Informasi Email
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Email: ${user?.email ?? 'Tidak Tersedia'}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Informasi User ID
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_circle, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'User ID: ${user?.uid ?? 'Tidak Tersedia'}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Tambahan Informasi Nama (Jika Ada)
              if (user?.displayName != null)
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Nama: ${user?.displayName ?? 'Tidak Ada'}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(height: 20),

              // Selamat datang
              Center(
                child: Text(
                  'Selamat datang, ${user?.email ?? "Pengguna"}!',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
