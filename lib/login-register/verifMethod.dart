import 'package:flutter/material.dart';
import 'otp.dart';

class VerifMethodPage extends StatefulWidget {
  const VerifMethodPage({super.key});

  @override
  _VerifMethodPageState createState() => _VerifMethodPageState();
}

class _VerifMethodPageState extends State<VerifMethodPage> {
  int _selectedMethod = -1; // -1 = belum dipilih, 0 = kiri, 1 = kanan

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
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Metode',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Verifikasi',
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
                        'Silakan pilih metode verifikasi untuk mengatur ulang kata sandi akun Anda.',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedMethod = 1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      _selectedMethod == 0 ||
                                              _selectedMethod == -1
                                          ? Color(0xFF8E1616).withOpacity(0.22)
                                          : Color(0xFF462F4D),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(Icons.apple, size: 32),
                                    SizedBox(height: 8),
                                    Text('Metode A', textAlign: TextAlign.left),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 6), // jarak antar tombol
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.20,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedMethod = 0;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      _selectedMethod == 1 ||
                                              _selectedMethod == -1
                                          ? Color(0xFF8E1616).withOpacity(0.22)
                                          : Color(0xFF462F4D),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(Icons.apple, size: 32),
                                    SizedBox(height: 8),
                                    Text('Metode B', textAlign: TextAlign.left),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.30),
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
                                  builder: (context) => OtpPage(),
                                ),
                              );
                              // if (_selectedMethod == 0) {
                              // } else if (_selectedMethod == 1) {}
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
    );
  }
}
