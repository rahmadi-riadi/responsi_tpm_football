import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

/// Layar untuk menampilkan detail tim sepak bola.
class DetailTeamScreen extends StatefulWidget {
  /// Konstruktor untuk membuat instance dari layar ini.
  /// [idClub] adalah ID tim sepak bola yang ingin ditampilkan.
  const DetailTeamScreen({required this.idClub});

  /// ID tim sepak bola yang ingin ditampilkan.
  final int idClub;

  @override
  _DetailTeamScreenState createState() => _DetailTeamScreenState();
}

/// StateObject untuk layar DetailTeamScreen.
class _DetailTeamScreenState extends State<DetailTeamScreen> {
  /// Future untuk mengambil data tim sepak bola berdasarkan ID tim.
  late Future<Map<String, dynamic>> teamData;

  /// Fungsi untuk mengambil data tim sepak bola berdasarkan ID tim.
  Future<Map<String, dynamic>> fetchTeamData() async {
    final response = await http.get(Uri.parse(
        'https://go-football-api-v44dfgjgyq-et.a.run.app/1/${widget.idClub}'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['Data'];
    } else {
      throw Exception('Failed to load team data');
    }
  }

  /// Inisialis state layar.
  @override
  void initState() {
    super.initState();
    teamData = fetchTeamData();
  }

  /// Membuat layar.
  @override
  Widget build(BuildContext context) {
    /// Membuat FutureBuilder untuk menampilkan data tim sepak bola.
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Team'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: teamData,
        builder: (context, snapshot) {
          /// Jika data sedang di proses...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            /// Jika terjadi kesalahan...
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            /// Jika data sudah tersedia...
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                /// Menampilkan logo tim sepak bola.
                Image.network(
                  snapshot.data!['LogoClubUrl'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                /// Menampilkan nama tim.
                Text(
                  'Name: ${snapshot.data!['NameClub']}',
                  style: TextStyle(fontSize: 18),
                ),
                /// Menampilkan nama stadion tim.
                Text(
                  'Stadium: ${snapshot.data!['StadiumName']}',
                  style: TextStyle(fontSize: 18),
                ),
                /// Menampilkan nama kapten tim.
                Text(
                  'Captain: ${snapshot.data!['CaptainName']}',
                  style: TextStyle(fontSize: 18),
                ),
                /// Menampilkan nama pelatih tim.
                Text(
                  'Head Coach: ${snapshot.data!['HeadCoach']}',
                  style: TextStyle(fontSize: 18),
                ),
                /// Tombol untuk membuka aplikasi web untuk melihat logo tim.
                ElevatedButton(
                  onPressed: () {
                    launch(
                      snapshot.data!['LogoClubUrl'],
                      forceWebView: true,
                    );
                  },
                  child: Text('Lihat Logo'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

