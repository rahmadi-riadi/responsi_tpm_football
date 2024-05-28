import 'package:flutter/material.dart';
import 'screens/leagues_screen.dart';
import 'screens/teams_screen.dart';
import 'screens/detail_team_screen.dart';

/// Pemanggil fungsi utama untuk menjalankan aplikasi
void main() {
  runApp(MyApp());
}

/// Widget utama dari aplikasi
class MyApp extends StatelessWidget {
  @override
  /// Mengembalikan widget MaterialApp
  Widget build(BuildContext context) {
    /// Widget utama dari MaterialApp
    return MaterialApp(
      /// Agar tidak menampilkan banner untuk debug mode
      debugShowCheckedModeBanner: false,
      /// Judul dari aplikasi
      title: 'Football App',
      /// Theme dari aplikasi
      theme: ThemeData(
        /// Pemilihan warna utama dari aplikasi
        primarySwatch: Colors.blue,
        /// Visual density yang digunakan oleh aplikasi
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      /// Route yang diatur oleh aplikasi
      initialRoute: '/',
      /// Menentukan fungsi yang akan dijalankan untuk setiap route
      routes: {
        /// Route ke Layar LeaguesScreen
        '/': (context) => LeaguesScreen(),
        /// Route ke Layar TeamsScreen
        '/teams': (context) => TeamsScreen(),
      },
      /// Fungsi yang akan dijalankan untuk setiap route yang tidak diatur di atas
      /// jika route-nya adalah '/detail_team' maka akan menampilkan DetailTeamScreen
      /// dengan menggunakan parameter 'idClub'
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

