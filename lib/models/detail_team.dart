// lib/models/detail_team.dart
class DetailTeam {
  final int id;
  final String name;
  final String logoUrl;
  final String stadiumName;
  final String captainName;
  final String headCoach;

  DetailTeam({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.stadiumName,
    required this.captainName,
    required this.headCoach,
  });

  factory DetailTeam.fromJson(Map<String, dynamic> json) {
    return DetailTeam(
      id: json['IdClub'],
      name: json['NameClub'],
      logoUrl: json['LogoClubUrl'],
      stadiumName: json['StadiumName'],
      captainName: json['CaptainName'],
      headCoach: json['HeadCoach'],
    );
  }
}
