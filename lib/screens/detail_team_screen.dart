import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailTeamScreen extends StatefulWidget {
  final int idClub;

  DetailTeamScreen({required this.idClub});

  @override
  _DetailTeamScreenState createState() => _DetailTeamScreenState();
}

class _DetailTeamScreenState extends State<DetailTeamScreen> {
  late Future<Map<String, dynamic>> teamData;

  @override
  void initState() {
    super.initState();
    teamData = fetchTeamData();
  }

  Future<Map<String, dynamic>> fetchTeamData() async {
    final response = await http.get(Uri.parse(
        'https://go-football-api-v44dfgjgyq-et.a.run.app/1/${widget.idClub}'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['Data'];
    } else {
      throw Exception('Failed to load team data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Team'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: teamData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Image.network(
                  snapshot.data!['LogoClubUrl'],
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20),
                Text(
                  'Name: ${snapshot.data!['NameClub']}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Stadium: ${snapshot.data!['StadiumName']}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Captain: ${snapshot.data!['CaptainName']}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Head Coach: ${snapshot.data!['HeadCoach']}',
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle logo URL button press
                  },
                  child: Text('Logo URL'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
