import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});
  @override
  AuthPage createState() {
    return AuthPage();
  }
}

class AuthPage extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Page',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menjaga konten di atas
          children: [
            Image.asset(
              'assets/images/login/start.png',
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8E1616),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // agar pas ukurannya
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail_outlined,
                          ), // ikon bisa ganti sesuai kebutuhan
                          SizedBox(width: 8), // jarak antara ikon dan teks
                          Text('Daftar dengan email'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 6), // jarak antar tombol
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // rata & ada jarak
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8E1616),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Ink.image(
                              image: AssetImage(
                                'assets/images/login/google.png',
                              ),
                              fit: BoxFit.cover,
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6), // jarak antar tombol
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 64,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8E1616),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Icon(Icons.apple, size: 32)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ), // jarak antar tombol // jarak antar tombol
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8E1616),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // agar pas ukurannya
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                          ), // ikon bisa ganti sesuai kebutuhan
                          SizedBox(width: 8), // jarak antara ikon dan teks
                          Text('Lanjutkan sebagai Guest'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Punya akun? Login', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
