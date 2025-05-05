# HeartBite - Aplikasi Berbagi Resep
Aplikasi berbagi resep berbasis Flutter yang dikembangkan oleh Kelompok 23 untuk mata kuliah Provis.

### 👥 Anggota Tim
- 2308428 LYAN NAZHABIL DZUQUWWA
- 2307840 ISMAIL FATIH RAIHAN
- 2305672 MUHAMMAD HAFIDH FADHILAH
- 2306026 ELSA NURJANAH
- 2306924 MUHAMMAD ICHSAN KHAIRULLAH

# 📱 Fitur-Fitur
### Autentikasi Pengguna
- Sistem Login/Register
- Pemulihan kata sandi dengan verifikasi OTP
- Manajemen profil
### Manajemen Resep
- Lihat detail resep dengan bahan dan langkah-langkah
- Galeri foto untuk setiap resep
- Bagian komentar dan diskusi
- Instruksi memasak langkah demi langkah
### Personalisasi
- Pengaturan preferensi pribadi
- Pembatasan diet
- Informasi alergi
- Bookmark resep favorit
### Fitur Sosial
- Ikuti pengguna lain
- Lihat pengikut/mengikuti
- Interaksi melalui komentar

# 🛠️ Detail Teknis
### Prasyarat
- Flutter SDK ^3.7.2
- Dart SDK ^3.7.2
- Android Studio / VS Code
- Android SDK & NDK
### Dependensi
```
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1
  cupertino_icons: ^1.0.8
  flutter_screenutil: ^5.7.0
  iconify_flutter: ^0.0.7
```
### Instalasi
1. Klon repositori
   ```
   git clone https://github.com/Ilyessin12/heartbite_tubesprovis.git
   ```
3. Instal dependensi
   ```
   flutter pub get
   ```
5. Jalankan aplikasi
   ```
   flutter run
   ```

# 🏗️ Struktur Proyek
lib/ <br/>
├── welcome_pages/      # Layar perkenalan <br/>
├── login-register/     # Alur autentikasi <br/>
├── setup_pages/        # Pengaturan & preferensi pengguna <br/>
├── notification_pages/ # Penanganan notifikasi <br/>
├── bookmark/          # Bookmark resep <br/>
├── homepage/          # Layar utama aplikasi <br/>
├── sidebar/           # Navigasi & pengaturan <br/>
└── recipe_detail/     # Tampilan & interaksi resep

# 📱 Screenshot Layar
#### Halaman Pembuka
![Screenshot_20250505-180555](https://github.com/user-attachments/assets/218723d6-b890-4195-9957-fdd8ceac099b)
![Screenshot_20250505-180601](https://github.com/user-attachments/assets/810cfa95-91c7-4a89-90e3-ef2a198c9a03)
![Screenshot_20250505-180607](https://github.com/user-attachments/assets/f5e23c57-6fc1-47af-af2f-9d6b633b3082)
![Screenshot_20250505-180611](https://github.com/user-attachments/assets/69b8a076-03e8-46bb-823c-8f49941586f5)

#### Halaman Autentikasi
![Screenshot_20250505-180617](https://github.com/user-attachments/assets/614c655b-4eac-4307-81a3-44286003e3e0)

#### Halaman Login & Register
![Screenshot_20250505-180623](https://github.com/user-attachments/assets/5209be18-33e8-4dbc-81da-f3182bd4d38f)
![Screenshot_20250505-180627](https://github.com/user-attachments/assets/0eb1dcb4-6af5-46a9-8e3a-4d2e328de51f)

#### Halaman Lupa & Reset Password
![Screenshot_20250505-180632](https://github.com/user-attachments/assets/c9c28ed7-d5f3-4e72-8830-376918e4a633)
![Screenshot_20250505-180636](https://github.com/user-attachments/assets/8d37a763-eb6d-4cb7-be02-80d950bf87a5)

#### Halaman OTP
![Screenshot_20250505-180655](https://github.com/user-attachments/assets/574d3c0e-1b2b-4036-a805-d82be2aa226f)

#### Halaman Verifikasi
![Screenshot_20250505-180646](https://github.com/user-attachments/assets/3797bffb-215c-4acd-902f-be3421b8daf3)

#### Halaman Setup
![Screenshot_20250505-180701](https://github.com/user-attachments/assets/1d5e5494-8464-4b68-8992-a8857e6333f1)
![Screenshot_20250505-180704](https://github.com/user-attachments/assets/b9569b31-1c17-4350-85bd-9f8a49460c19)
![Screenshot_20250505-180707](https://github.com/user-attachments/assets/415d4957-b040-434d-8aff-c911abd60fa5)
![Screenshot_20250505-180710](https://github.com/user-attachments/assets/409e1a2f-0b8b-467f-bca7-9bec8e3f7b9e)

#### Halaman Notifikasi
![Screenshot_20250505-180716](https://github.com/user-attachments/assets/232b20e0-4286-4c71-bc18-8a6906726503)
![Screenshot_20250505-180719](https://github.com/user-attachments/assets/9890e5e4-ec65-46a4-b2ba-63426030d76f)

#### Halaman Home Page
![Screenshot_20250505-180726](https://github.com/user-attachments/assets/db88978b-048d-428b-adee-ff7c9a026c63)

#### Halaman Informasi Tentang Aplikasi
![Screenshot_20250505-180735](https://github.com/user-attachments/assets/9762fb82-d4c3-43c6-88b8-6fb517345d1f)

#### Halaman Pengaturan Negara
![Screenshot_20250505-180738](https://github.com/user-attachments/assets/6670d574-e6f3-4091-bb77-e9424cea973a)

#### Halaman Edit Profil
![Screenshot_20250505-180742](https://github.com/user-attachments/assets/dca1de43-fcd9-4664-bc4b-f7e124772b16)

#### Halaman Follower dan Following
![Screenshot_20250505-180748](https://github.com/user-attachments/assets/e84b647a-ce2d-4aa3-b0d4-96438a241a6b)
![Screenshot_20250505-180753](https://github.com/user-attachments/assets/0a0f60e5-eeba-4c2a-8d62-7ed17ca7b812)

#### Halaman Pengaturan Notifikasi
![Screenshot_20250505-180758](https://github.com/user-attachments/assets/b44bd21f-0155-49d8-bb58-08c401cfd907)

#### Halaman Profil
![Screenshot_20250505-180803](https://github.com/user-attachments/assets/40650e81-d48a-4324-8c79-b6b9221a2a6c)

#### Halaman Pengaturan
![Screenshot_20250505-180807](https://github.com/user-attachments/assets/ee4eeaa6-241e-4304-9479-19a659ec0b0e)

#### Halaman Detail Resep
![Screenshot_20250505-180825](https://github.com/user-attachments/assets/ffed385b-8032-4545-a3b5-4a88103804a9)
![Screenshot_20250505-180829](https://github.com/user-attachments/assets/07d9ed16-c026-41aa-affd-1d179d727361)
![Screenshot_20250505-180832](https://github.com/user-attachments/assets/d0d3ef54-4bc1-427a-82f6-f455f29830ec)
![Screenshot_20250505-180834](https://github.com/user-attachments/assets/ac207a23-2220-46dd-b4b4-e2dcb00fa450)

#### Halaman Bahan-Bahan
![Screenshot_20250505-180847](https://github.com/user-attachments/assets/a1a0ae69-ab39-41c4-9cab-8150bf2a4c5a)

#### Halaman Instruksi
![Screenshot_20250505-180853](https://github.com/user-attachments/assets/8e887568-0746-4895-926f-48a64c4fbc89)

#### Halaman Galeri
![Screenshot_20250505-180902](https://github.com/user-attachments/assets/603ae3f5-4876-4937-8fa1-bdcbf0491ee4)

#### Halaman Diskusi
![Screenshot_20250505-180912](https://github.com/user-attachments/assets/0997b211-5d18-4b1f-a99a-bd51b2895981)


# 📱 Video Fitur Searching & Filter
![Screen_Recording_20250505_181119](https://github.com/user-attachments/assets/0e4b9573-3007-4b14-9030-9dd0f4fb4386)
