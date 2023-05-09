import 'song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Rap',
      songs: Song.songs,
      imageUrl:
          'https://marketplace.canva.com/EAEdeiU-IeI/1/0/1600w/canva-purple-and-red-orange-tumblr-aesthetic-chill-acoustic-classical-lo-fi-playlist-cover-jGlDSM71rNM.jpg',
    ),
    Playlist(
      title: 'Hip-Hop',
      songs: Song.songs,
      imageUrl:
          'https://i0.wp.com/olumuse.org/wp-content/uploads/2020/09/unnamed.jpg?fit=512%2C512&ssl=1',
    ),
    Playlist(
      title: 'Death Metal',
      songs: Song.songs,
      imageUrl:
          'https://e1.pxfuel.com/desktop-wallpaper/605/749/desktop-wallpaper-claire-yoshioka-spotify-playlist-cover-thumbnail.jpg',
    ),
  ];
}
