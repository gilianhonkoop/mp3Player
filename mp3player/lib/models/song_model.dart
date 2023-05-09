class Song {
  final String title;
  final String artist;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.artist,
      required this.description,
      required this.url,
      required this.coverUrl});

  static List<Song> songs = [
    Song(
      title: 'Verblind',
      artist: 'Shah',
      description: 'Verblind',
      url:
          "assets/music/Shah - Verblind ft DIKKE & LA\$\$A (Prod. PICVSSO & LA\$\$A).mp3",
      coverUrl: 'assets/images/1.jpg',
    ),
    Song(
      title: 'Churchill Downs',
      artist: 'Jack Harlow ft. Drake',
      description: 'Churchill Downs',
      url: "assets/music/Jack Harlow - Churchill Downs feat. Drake.mp3",
      coverUrl: 'assets/images/2.jpeg',
    ),
    Song(
      title: 'Taste',
      artist: 'Tyga ft. Offset',
      description: 'Taste',
      url: "assets/music/Tyga - Taste ft. Offset.mp3",
      coverUrl: 'assets/images/3.png',
    ),
    Song(
      title: 'Fuck it allemaal',
      artist: 'Lange Ritch',
      description: 'Fuck it allemaal',
      url: "assets/music/Fuck it allemaal.mp3",
      coverUrl: 'assets/images/4.jpg',
    ),
  ];
}
