// screens/payment_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_provider.dart';
import 'order_model.dart';
import '../main.dart'; // Import MainApp

class PaymentPage extends StatefulWidget {
  final String armada;

  PaymentPage({required this.armada});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;

  final List<Map<String, dynamic>> _paymentMethods = [
    {"name": "Bank Transfer", "icon": Icons.account_balance},
    {"name": "E-Wallet", "icon": Icons.account_balance_wallet},
    {"name": "COD (Cash or Duel!)", "icon": Icons.money},
  ];

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    final String biaya =
        widget.armada == 'Motor' ? 'Rp 15.000' : 'Rp 45.000';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pembayaran'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Pembayaran',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPaymentDetailRow("Armada", widget.armada),
                  _buildPaymentDetailRow("Biaya", biaya),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Column(
              children: _paymentMethods.map((method) {
                return ListTile(
                  leading: Icon(method['icon'], color: Colors.green),
                  title: Text(method['name']),
                  trailing: Radio<String>(
                    value: method['name'],
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedPaymentMethod != null) {
                  orderProvider.tambahPesanan(
                    OrderModel(
                      tanggal: DateTime.now().toString(),
                      armada: widget.armada,
                      lokasi: 'Lokasi dipilih pengguna',
                      status: 'Selesai',
                    ),
                  );

                  _showSuccessDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pilih metode pembayaran terlebih dahulu!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Konfirmasi Pembayaran',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text('Pembayaran Berhasil'),
          content: Text(
              'Pesanan Anda telah berhasil diproses menggunakan $_selectedPaymentMethod.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainApp(selectedIndex: 2), // Index ke Riwayat
                  ),
                );
              },
              child: Text('Lihat Riwayat'),
            ),
          ],
        );
      },
    );
  }
}
