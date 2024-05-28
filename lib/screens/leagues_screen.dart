import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'teams_screen.dart';

/// Layar untuk menampilkan daftar liga sepak bola.
class LeaguesScreen extends StatefulWidget {
  @override
  _LeaguesScreenState createState() => _LeaguesScreenState();
}

/// State untuk layar LeaguesScreen.
class _LeaguesScreenState extends State<LeaguesScreen> {
  /// Daftar liga sepak bola yang diambil dari API.
  List<dynamic> leagues = [];

  /// Metode untuk mengambil data liga sepak bola dari API.
  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://go-football-api-v44dfgjgyq-et.a.run.app/'));
    if (response.statusCode == 200) {
      /// Update state dengan data yang diambil dari API.
      setState(() {
        leagues = json.decode(response.body)['Data'];
      });
    } else {
      /// Jika data tidak berhasil diambil, maka throw exception.
      throw Exception('Failed to load leagues');
    }
  }

  /// Metode untuk memuat layar.
  @override
  Widget build(BuildContext context) {
    /// Buat layar dengan appBar berjudul "Leagues".
    return Scaffold(
      appBar: AppBar(
        title: Text('Leagues'),
      ),
      /// Buat GridView untuk menampilkan daftar liga sepak bola.
      /// GridTile yang dihasilkan akan di tap untuk navigasi ke halaman TeamsScreen.
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: leagues.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              /// Navigasi ke halaman TeamsScreen saat di tap.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeamsScreen()),
              );
            },
            child: GridTile(
              /// Tampilkan gambar logo liga sepak bola.
              child: Image.network(
                leagues[index]['logoLeagueUrl'],
                fit: BoxFit.cover,
              ),
              /// Tampilkan nama liga sepak bola di footer GridTile.
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  leagues[index]['leagueName'],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

