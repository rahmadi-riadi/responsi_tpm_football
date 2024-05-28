// lib/models/detail_team.dart
/// Class untuk representasi data tim sepak bola.
class DetailTeam {
  /// ID tim sepak bola.
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

  /// Konstruktor untuk membuat objek DetailTeam.
  ///
  /// [id] ID tim sepak bola.
  /// [name] Nama tim sepak bola.
  /// [logoUrl] URL gambar logo tim sepak bola.
  /// [stadiumName] Nama stadion tim sepak bola.
  /// [captainName] Nama kapten tim sepak bola.
  /// [headCoach] Nama pelatih tim sepak bola.
  const DetailTeam({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.stadiumName,
    required this.captainName,
    required this.headCoach,
  });

  /// Fungsi untuk membuat objek DetailTeam dari json.
  ///
  /// [json] Objek Map yang berisi data tim sepak bola dalam bentuk json.
  ///
  /// Return objek DetailTeam.
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

