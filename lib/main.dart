import 'package:flutter/material.dart';
import 'screens/leagues_screen.dart';
import 'screens/teams_screen.dart';
import 'screens/detail_team_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LeaguesScreen(),
        '/teams': (context) => TeamsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail_team') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => DetailTeamScreen(idClub: args['idClub']),
          );
        }
        return null;
      },
    );
  }
}
