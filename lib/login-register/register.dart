import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text('Masuk', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Daftar',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    // Text field input
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(13, 0, 0, 0),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  // Kode Telepon
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.25,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField<String>(
                                        value: '+62',
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 18,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        items:
                                            ['+62', '+1', '+44', '+91']
                                                .map(
                                                  (code) => DropdownMenuItem(
                                                    value: code,
                                                    child: Text(code),
                                                  ),
                                                )
                                                .toList(),
                                        onChanged: (value) {
                                          // TODO
                                        },
                                      ),
                                    ),
                                  ),

                                  // Garis pemisah
                                  Container(
                                    height: 36,
                                    width: 1,
                                    color: Colors.grey.shade400,
                                  ),

                                  // Nomor Telepon
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: 'Nomor Telepon',
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 18,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Nama Lengkap',
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
                              decoration: InputDecoration(
                                hintText: 'Username',
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
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                    // Tombol daftar
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width:
                                MediaQuery.of(context).size.width *
                                0.65, // Atur lebar sesuai kebutuhan
                            child: Text(
                              'Dengan mendaftar Anda menyetujui Syarat dan Ketentuan kami',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
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
                            child: Text('Daftar'),
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
