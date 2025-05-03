import 'package:flutter/material.dart';
import 'register.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
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
                    // Baris atas: tombol back & ResetPass
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
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Atur Ulang',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Kata Sandi',
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
                            TextField(
                              obscureText:
                                  !_isPasswordVisible, // Menyembunyikan atau menampilkan password
                              decoration: InputDecoration(
                                hintText: 'Konfirmasi Kata Sandi',
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
                          ],
                        ),
                      ),
                    ),
                    // Tombol daftar
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8E1616),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Selesai'),
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
