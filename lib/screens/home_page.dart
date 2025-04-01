// screens/home_page.dart
import 'package:flutter/material.dart';
import 'pick_location_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.03), // 3% dari tinggi layar
            _buildSearchBar(context, screenWidth),
            SizedBox(height: screenHeight * 0.03), // 3% dari tinggi layar
            _buildHeaderSection(context, screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03), // 3% dari tinggi layar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% dari lebar layar
              child: Text(
                'Pilih Armada Angkut!',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blueAccent,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // 2% dari tinggi layar
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% dari lebar layar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _buildArmadaCard(
                        context,
                        armada: 'Motor',
                        imagePath: 'lib/assets/motor_sampah.png',
                        title: 'Motor',
                        rating: 'max: 10 kg',
                        discount: 'Rp.25.000',
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04), // 4% dari lebar layar
                    Expanded(
                      child: _buildArmadaCard(
                        context,
                        armada: 'Truck',
                        imagePath: 'lib/assets/truck.png',
                        title: 'Truck',
                        rating: 'max: 100 kg',
                        discount: 'Rp.65.000',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search Bar Widget
  Widget _buildSearchBar(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% dari lebar layar
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% dari lebar layar
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: screenWidth * 0.02), // 2% dari lebar layar
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Trash',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% dari lebar layar
      padding: EdgeInsets.all(screenWidth * 0.04), // 4% dari lebar layar
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sampah Anda Numpuk?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.03, // 3% dari tinggi layar
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01), // 1% dari tinggi layar
                Text(
                  'Buangin Aja!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.025, // 2.5% dari tinggi layar
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'lib/assets/truck.png',
            width: screenWidth * 0.25, // 25% dari lebar layar
            height: screenHeight * 0.15, // 15% dari tinggi layar
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  // Widget Armada Card
  Widget _buildArmadaCard(
    BuildContext context, {
    required String armada,
    required String imagePath,
    required String title,
    required String rating,
    required String discount,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PickLocationPage(armada: armada),
          ),
        );
      },
      child: Container(
        width: double.infinity, // Membuat lebar container menyesuaikan dengan ruang yang tersedia
        height: 300,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(24),
          border: Border(
            top: BorderSide(color: Colors.grey[300]!, width: 1),
            right: BorderSide.none,
            bottom: BorderSide.none,
            left: BorderSide.none,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4), // Warna hijau transparan
              blurRadius: 15, // Membuat efek cahaya lebih besar
              spreadRadius: 2, // Efek cahaya menyebar ke luar
              offset: Offset(0, 0), // Menyebar di semua sisi
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 80, height: 80),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              '$discount',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text(
                  rating,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 37, 237, 234),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickLocationPage(armada: armada),
                  ),
                );
              },
              child: Text('Pesan', style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
