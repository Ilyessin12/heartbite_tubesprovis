import 'package:flutter/material.dart';
import 'register.dart';
import 'forgotPass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variabel untuk mengatur apakah password terlihat atau tidak
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: SingleChildScrollView(
            // memungkinkan scroll
            child: ConstrainedBox(
              // agar tidak tak terbatas tingginya
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    16, // untuk menyamakan dengan padding vertikal total
              ),
              child: IntrinsicHeight(
                // agar Column bisa mengatur tinggi anak-anaknya
                child: Column(
                  children: [
                    // Baris atas: tombol back & login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Ink(
                          decoration: const ShapeDecoration(
                            color: Color(0xFF8E1616),
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text('Daftar', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Masuk',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    // Text field input
                    Expanded(
                      child: Center(
                        child: Column(
                          children: [
                            // Teks deskripsi rata kiri
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Color.fromARGB(13, 0, 0, 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 18,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              obscureText:
                                  !_isPasswordVisible, // Menyembunyikan atau menampilkan password
                              decoration: InputDecoration(
                                hintText: 'Kata Sandi',
                                filled: true,
                                fillColor: Color.fromARGB(13, 0, 0, 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 18,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPassPage(),
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.topRight, // tengah layar
                                child: SizedBox(
                                  width: 300, // atau sesuai kebutuhan
                                  child: Text(
                                    'Lupa kata sandi?',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Tombol daftar
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly, // rata & ada jarak
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 56,
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
                                height: 56,
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
                                    children: const [
                                      Icon(Icons.apple, size: 32),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              // Aksi daftar
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8E1616),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Masuk'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
