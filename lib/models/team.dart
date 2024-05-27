// lib/models/team.dart
class Team {
  final int id;
  final String name;
  final String logoUrl;
  final String stadiumName;
  final String captainName;
  final String headCoach;

  Team({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.stadiumName,
    required this.captainName,
    required this.headCoach,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['IdClub'],
      name: json['NameClub'],
      logoUrl: json['LogoClubUrl'],
      stadiumName: json['StadiumName'],
      captainName: json['CaptainName'],
      headCoach: json['HeadCoach'],
    );
  }
}
