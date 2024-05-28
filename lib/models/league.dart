// lib/models/league.dart
/// Class untuk menampung data liga sepak bola
class League {
  /// ID liga sepak bola
  final int id;

  /// Nama liga sepak bola
  final String name;

  /// Negara liga sepak bola
  final String country;

  /// URL logo liga sepak bola
  final String logoUrl;

  /// Nama pelatih liga sepak bola
  final String leader;

  /// Konstruktor untuk membuat objek League dari data
  /// yang diterima sebagai parameter
  const League({
    required this.id,
    required this.name,
    required this.country,
    required this.logoUrl,
    required this.leader,
  });

  /// Fungsi static untuk membuat objek League dari data JSON
  /// yang diterima sebagai parameter
  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['idLeague'],
      name: json['leagueName'],
      country: json['country'],
      logoUrl: json['logoLeagueUrl'],
      leader: json['leaderStandings'],
    );
  }
}

