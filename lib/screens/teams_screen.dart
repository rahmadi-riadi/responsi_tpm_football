import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  List<dynamic> _teams = []; // ini variabel untuk menyimpan data tim sepak bola
  Future<void> _fetchData() async { // fungsi untuk mengambil data tim sepak bola
    final response = await http.get(Uri.parse('https://go-football-api-v44dfgjgyq-et.a.run.app/1/'));
    if (response.statusCode == 200) {
      setState(() { // ketika data berhasil diambil, maka update variabel _teams
        _teams = json.decode(response.body)['Data'];
      });
    } else {
      throw Exception('Failed to load teams'); // jika data tidak berhasil diambil, maka throw exception
    }
  }

  @override
  void initState() {
    super.initState(); // panggil fungsi yang ada di class parent, yaitu StatefulWidget
    _fetchData(); // panggil fungsi _fetchData untuk mengambil data tim sepak bola
  }

  @override
  Widget build(BuildContext context) { // fungsi untuk membuat tampilan
    return Scaffold(
      appBar: AppBar(
        title: Text('Teams'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _teams.length, // jumlah item yang akan di tampilkan adalah jumlah data di variabel _teams
        itemBuilder: (BuildContext context, int index) {
          // buat tampilan untuk setiap data tim sepak bola di _teams
          return GestureDetector(
            onTap: () { // ketika di tap, maka navigate ke halaman detail tim sepak bola
              Navigator.pushNamed(
                context,
                '/detail_team',
                arguments: {
                  'idClub': _teams[index]['IdClub'],
                },
              );
            },
            child: GridTile(
              child: Image.network(
                _teams[index]['LogoClubUrl'], // gambar logo tim sepak bola
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  _teams[index]['NameClub'], // nama tim sepak bola
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

