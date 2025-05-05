import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/country_list_item.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  String _selectedCountry = 'Indonesia';

  final List<Map<String, dynamic>> countries = [
    {
      'name': 'Albania',
      'flagUrl': 'https://flagcdn.com/h20/al.png',
      'code': 'al',
    },
    {
      'name': 'Antigua',
      'flagUrl': 'https://flagcdn.com/h20/ag.png',
      'code': 'ag',
    },
    {
      'name': 'Algeria',
      'flagUrl': 'https://flagcdn.com/h20/dz.png',
      'code': 'dz',
    },
    {
      'name': 'American Samoa',
      'flagUrl': 'https://flagcdn.com/h20/as.png',
      'code': 'as',
    },
    {
      'name': 'Andorra',
      'flagUrl': 'https://flagcdn.com/h20/ad.png',
      'code': 'ad',
    },
    {
      'name': 'Angola',
      'flagUrl': 'https://flagcdn.com/h20/ao.png',
      'code': 'ao',
    },
    {
      'name': 'Anguilla',
      'flagUrl': 'https://flagcdn.com/h20/ai.png',
      'code': 'ai',
    },
    {
      'name': 'Argentina',
      'flagUrl': 'https://flagcdn.com/h20/ar.png',
      'code': 'ar',
    },
    {
      'name': 'Armenia',
      'flagUrl': 'https://flagcdn.com/h20/am.png',
      'code': 'am',
    },
    {
      'name': 'Indonesia',
      'flagUrl': 'https://flagcdn.com/h20/id.png',
      'code': 'id',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return CountryListItem(
                    name: country['name'],
                    flagUrl: country['flagUrl'],
                    isSelected: country['name'] == _selectedCountry,
                    onTap: () {
                      setState(() {
                        _selectedCountry = country['name'];
                      });
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // Merah sesuai theme
                    foregroundColor: Colors.white,      // Warna teks putih
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat jarak antara teks dan ikon
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 160.0), // Geser teks ke kanan
                        child: const Text('Simpan'),
                      ),
                      const Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomBackButton(
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Negara',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 32), // For balance
        ],
      ),
    );
  }
}
