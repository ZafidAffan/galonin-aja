// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/edukasi_page.dart';
import 'screens/profil_page.dart';
import 'screens/riwayat_page.dart';
import 'screens/order_provider.dart';
import 'screens/about_page.dart'; // Import halaman About

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // SplashScreen pertama
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mengarahkan ke halaman login atau main app setelah 3 detik
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BuanginApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo.png', // Path logo splash screen
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20), // Memberikan jarak antara logo dan teks
            Text(
              'Sampahmu Uang Kami!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontFamily: 'Montserrat', // Sesuaikan dengan font yang Anda pilih
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Wrapper untuk aplikasi utama setelah login atau splash
class BuanginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (!snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(), // Halaman login jika belum login
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainApp(), // Halaman utama aplikasi jika sudah login
        );
      },
    );
  }
}

// Halaman utama dengan BottomNavigationBar
class MainApp extends StatefulWidget {
  final int selectedIndex;
  MainApp({this.selectedIndex = 0});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<Widget> _pages = [
    HomePage(),
    EdukasiPage(),
    RiwayatPage(),
    ProfilPage(),
    AboutPage(), // Tambahkan AboutPage di sini
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Image.asset(
          'lib/assets/logoFont.png',
          width: 120,
          height: 500,
          fit: BoxFit.contain,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logout gagal: $e')),
                );
              }
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Edukasi'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'), // Tombol Tentang
        ],
      ),
    );
  }
}
