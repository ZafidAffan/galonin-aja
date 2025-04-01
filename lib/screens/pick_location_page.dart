// screens/pick_location_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'payment_page.dart'; // Import halaman pembayaran

class PickLocationPage extends StatefulWidget {
  final String armada; // Armada yang dipilih (Motor/Truck)

  PickLocationPage({required this.armada});

  @override
  _PickLocationPageState createState() => _PickLocationPageState();
}

class _PickLocationPageState extends State<PickLocationPage> {
  GoogleMapController? _mapController;

  // Koordinat awal (Jakarta)
  final LatLng _initialPosition = LatLng(-7.781173490392317, 110.367383038006);

  // Marker untuk lokasi yang dipilih
  LatLng? _selectedLocation;
  Set<Marker> _markers = {};

  // Fungsi saat peta dibuat
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  // Fungsi saat peta diketuk
  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedLocation = position;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('selected-location'),
          position: position,
          infoWindow: InfoWindow(title: 'Lokasi Terpilih'),
        ),
      );
    });
  }

  // Fungsi menampilkan dialog berhasil
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Proses Berhasil'),
          content: Text('Lokasi telah dipilih dan proses berhasil.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                // Navigasi ke halaman pembayaran dengan data armada
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(armada: widget.armada),
                  ),
                );
              },
              child: Text('Lanjutkan ke Pembayaran'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pick Up Location'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Google Maps
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onTap: _onMapTapped, // Tap peta untuk memilih lokasi
            markers: _markers,
          ),

          // Tombol Pick Up Now
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedLocation != null) {
                  _showSuccessDialog(); // Tampilkan dialog sukses
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Silakan pilih lokasi terlebih dahulu!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Pick Up Now',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
