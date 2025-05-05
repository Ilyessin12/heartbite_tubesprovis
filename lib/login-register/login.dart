import 'package:flutter/material.dart';
import 'register.dart';
import 'forgotPass.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Ornament.png',
              fit: BoxFit.contain,
              alignment: Alignment.topLeft,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight:
                        MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        24,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF8E1616),
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
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
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Daftar',
                                  style: GoogleFonts.dmSans(fontSize: 16),
                                ),
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
                            'Masuk',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.dmSans(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                TextField(
                                  style: GoogleFonts.dmSans(),
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.dmSans(),
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
                                  style: GoogleFonts.dmSans(),
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: 'Kata Sandi',
                                    hintStyle: GoogleFonts.dmSans(),
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
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
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
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        'Lupa kata sandi?',
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.dmSans(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                          0xFF8E1616,
                                        ).withOpacity(0.2),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
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
                                SizedBox(width: 6),
                                Expanded(
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(
                                          0xFF8E1616,
                                        ).withOpacity(0.2),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                  // Aksi masuk
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF8E1616),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Masuk',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
