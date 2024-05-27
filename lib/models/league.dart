// lib/models/league.dart
class League {
  final int id;
  final String name;
  final String country;
  final String logoUrl;
  final String leader;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logoUrl,
    required this.leader,
  });

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
