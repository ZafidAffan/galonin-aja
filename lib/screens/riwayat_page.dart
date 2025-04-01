// screens/riwayat_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/order_provider.dart';

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context); // Ambil data riwayat

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),

              // Judul Riwayat
              Center(
                child: Text(
                  'Riwayat Pemesanan',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontFamily: 'Montserrat',
                    color: Colors.green[800],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Cek jika data kosong
              if (orderProvider.riwayatPesanan.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'Belum ada riwayat pemesanan.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                )
              else
                // ListView Riwayat Pemesanan
                Expanded(
                  child: ListView.builder(
                    itemCount: orderProvider.riwayatPesanan.length,
                    itemBuilder: (context, index) {
                      final order = orderProvider.riwayatPesanan[index];

                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(12),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Judul Armada
                            Text(
                              'Armada: ${order.armada}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 6),

                            // Lokasi
                            Text(
                              'Lokasi: ${order.lokasi}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 6),

                            // Tanggal
                            Text(
                              'Tanggal: ${order.tanggal}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),

                            SizedBox(height: 10),

                            // Status Pesanan
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  order.status,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: order.status == 'Selesai'
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
