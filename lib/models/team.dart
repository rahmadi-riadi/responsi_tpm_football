// lib/models/team.dart
/// Class untuk representasi data tim sepak bola.
class Team {
  /// Id dari tim sepak bola.
  final int id;

  /// Nama tim sepak bola.
  final String name;

  /// URL gambar logo tim sepak bola.
  final String logoUrl;

  /// Nama stadion tim sepak bola.
  final String stadiumName;

  /// Nama kapten tim sepak bola.
  final String captainName;

  /// Nama pelatih tim sepak bola.
  final String headCoach;

  /// Konstruktor untuk membuat objek Team.
  const Team({
    /// Id dari tim sepak bola.
    required this.id,
    /// Nama tim sepak bola.
    required this.name,
    /// URL gambar logo tim sepak bola.
    required this.logoUrl,
    /// Nama stadion tim sepak bola.
    required this.stadiumName,
    /// Nama kapten tim sepak bola.
    required this.captainName,
    /// Nama pelatih tim sepak bola.
    required this.headCoach,
  });

  /// Fungsi untuk membuat objek Team dari data JSON.
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

