import 'package:flutter/material.dart';
import 'resetPass.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

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
                        'Kode OTP',
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
                        'Silakan periksa email/SMS Anda untuk melihat pesan yang berisi kode OTP. Kode terdiri dari 4 angka.',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    // Text field input
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF8E1616).withOpacity(0.22),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                autofocus: index == 0,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  hintText: '—',
                                  counterText: "",
                                  enabledBorder: UnderlineInputBorder(
                                    // Tidak ada garis di bawah
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    // Tidak ada garis saat fokus
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    _focusNodes[index + 1].requestFocus();
                                  } else if (value.isEmpty && index > 0) {
                                    _focusNodes[index - 1].requestFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.45),
                    // Tombol daftar
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              final otp =
                                  _controllers.map((c) => c.text).join();
                              print(
                                'OTP: $otp',
                              ); // bisa digunakan untuk validasi

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResetPassPage(),
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
    );
  }
}
