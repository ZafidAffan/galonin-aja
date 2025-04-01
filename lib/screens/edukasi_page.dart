// screens/edukasi_page.dart
import 'package:flutter/material.dart';

class EdukasiPage extends StatelessWidget {
  // List informasi edukasi
  final List<Map<String, String>> edukasiData = [
    {
      'title': 'Pentingnya Daur Ulang',
      'content':
          'Daur ulang membantu mengurangi sampah yang menumpuk di tempat pembuangan akhir. Sampah seperti plastik, kertas, dan logam bisa digunakan kembali.',
      'image': 'lib/assets/pilih_sampah.jpg', // Gambar untuk topik ini
    },
    {
      'title': 'Mengurangi Sampah Plastik',
      'content':
          'Plastik membutuhkan waktu ratusan tahun untuk terurai. Gunakan tas belanja kain, botol minum, dan produk ramah lingkungan untuk membantu mengurangi sampah plastik.',
      'image': 'lib/assets/rumah_tangga.jpg',
    },
    {
      'title': 'Manfaat Bank Sampah',
      'content':
          'Bank sampah membantu masyarakat mengelola sampah dengan baik sambil memberikan keuntungan ekonomi melalui sistem tukar sampah.',
      'image': 'lib/assets/jenis_sampah.jpg',
    },
    {
      'title': 'Jenis Jenis Sampah',
      'content':
          'Sampah terbagi menjadi organik (sisa makanan, daun), anorganik (plastik, logam, kaca), B3 (berbahaya, seperti baterai), daur ulang (yang bisa diproses ulang), dan elektronik (perangkat usang). Pemilahan sampah penting untuk pengelolaan yang ramah lingkungan.',
      'image': 'lib/assets/jenis2sampah.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Informasi Edukasi',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    letterSpacing: 1.2,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Konten List Informasi Edukasi
            Expanded(
              child: ListView.builder(
                itemCount: edukasiData.length,
                itemBuilder: (context, index) {
                  final item = edukasiData[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar untuk Edukasi
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),

                        // Informasi Edukasi
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                item['content']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.justify, // Menambahkan TextAlign.justify
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
