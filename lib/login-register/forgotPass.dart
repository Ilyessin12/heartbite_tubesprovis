import 'package:flutter/material.dart';
import 'verifMethod.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.width * -0.475,
            left: MediaQuery.of(context).size.width * -0.75,
            child: Image.asset(
              'assets/images/login/spiral.png',
              width: MediaQuery.of(context).size.width * 1.5// sesuaikan ukuran jika perlu
            ),
          ),
          SafeArea(
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
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.075,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Lupa',
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Silakan masukkan alamat email atau nomor telepon Anda untuk mencari akun Anda.',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        // Text field input
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                // Teks deskripsi rata kiri
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email/Nomor Telepon',
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifMethodPage(),
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
                                child: Text('Lanjutkan'),
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
        ],
      ),
    );
  }
}
