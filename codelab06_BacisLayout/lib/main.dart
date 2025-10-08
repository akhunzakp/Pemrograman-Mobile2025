import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child:Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung Tangkuban Perahu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Bandung, Indonesia',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Gunung Tangkuban Parahu (Aksara Sunda Baku: ᮌᮥᮔᮥᮀ ᮒᮀᮊᮥᮘᮔ᮪ ᮕᮛᮠᮥ, Latin: Gunung Tangkuban Parahu) adalah salah satu gunung yang terletak di antara Kabupaten Subang dan Kabupaten Bandung Barat, Provinsi Jawa Barat, Indonesia '
        'Sekitar 20 km ke arah utara Kota Bandung, dengan rimbun pohon pinus dan hamparan kebun teh di sekitarnya, Gunung Tangkuban Parahu mempunyai ketinggian setinggi 2.086 meter. '
        'Bentuk gunung ini adalah Stratovolcano dengan pusat erupsi yang berpindah dari timur ke barat. '
        'Jenis batuan yang dikeluarkan melalui letusan kebanyakan adalah lava dan sulfur, mineral yang dikeluarkan adalah sulfur belerang, mineral yang dikeluarkan saat gunung tidak aktif adalah uap belerang.'
        'Daerah Gunung Tangkuban Parahu dikelola oleh Perum Perhutanan. Suhu rata-rata hariannya adalah 17oC pada siang hari dan 2 °C pada malam hari. '
        '\n\nYuma Akhunza Kausar Putra / 2341720259',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Layout Putra',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Layout Demo')),
        body: ListView(
          children: [
            Image.asset(
              'images/gunung.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection, 
          ],
        ),
      ),
    );
  }
}