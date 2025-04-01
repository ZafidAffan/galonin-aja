// screens/order_provider.dart
import 'package:flutter/material.dart';
import 'order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _riwayatPesanan = [];

  List<OrderModel> get riwayatPesanan => _riwayatPesanan;

  void tambahPesanan(OrderModel pesanan) {
    _riwayatPesanan.add(pesanan);
    notifyListeners();
  }
}
