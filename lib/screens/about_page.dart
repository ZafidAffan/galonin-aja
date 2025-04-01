// screens/about_page.dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Background color untuk halaman
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Judul Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Informasi Aplikasi',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat',
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              // Deskripsi Aplikasi
              Text(
                'Aplikasi ini bertujuan untuk mempermudah pengelolaan sampah. Kami menyediakan berbagai layanan yang memudahkan Anda untuk membuang sampah dengan armada yang sesuai.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Pembuat Aplikasi
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Dibuat oleh:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),

              // Daftar Pembuat Aplikasi dengan Gambar Karakter (Karakter ditata vertikal)
              Column(
                children: [
                  _buildCharacterColumn('lib/assets/karakter_berlian.jpg', 'Berliandya Hasanuddin'),
                  SizedBox(height: 20),
                  _buildCharacterColumn('lib/assets/karakter_rasyid.jpg', 'Ragil Nur Rasyid'),
                  SizedBox(height: 20),
                  _buildCharacterColumn('lib/assets/karakter_dika.jpg', 'Andhika Fahar zulianto'),
                  SizedBox(height: 20),
                  _buildCharacterColumn('lib/assets/karakter_dimas.jpg', 'Kadek Dimas Ganes Grahista'),
                ],
              ),
              SizedBox(height: 40),

              // Visi
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Visi:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Text(
                'Menjadi aplikasi yang mengedepankan keberlanjutan dengan menyediakan layanan pengelolaan sampah yang mudah dan ramah lingkungan.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontFamily: 'Montserrat',
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Misi
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Misi:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Text(
                '1. Mengedukasi masyarakat tentang pentingnya daur ulang sampah.\n'
                '2. Mempermudah akses layanan pengelolaan sampah.\n'
                '3. Meningkatkan kesadaran lingkungan di kalangan pengguna.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  fontFamily: 'Montserrat',
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Slogan
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Slogan:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Text(
                '“Sampahmu Uang Kami!”',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Membuat widget untuk karakter dan nama dengan efek lampu neon
  Widget _buildCharacterColumn(String imagePath, String name) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4), // Memberikan padding agar efek neon terlihat
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.7), // Warna neon hijau
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 0), // Efek cahaya menyebar di sekitar avatar
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 14,  // Ukuran font lebih kecil agar tidak merusak tata letak
            color: Colors.blueAccent,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
