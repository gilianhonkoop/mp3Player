import 'package:flutter/material.dart';
import 'package:mp3player/screens/green.dart';
import 'package:mp3player/screens/pink.dart';
import 'package:mp3player/screens/songs_screen.dart';
import 'package:mp3player/screens/test.dart';

import '../models/playlist_model.dart';
import '../models/song_model.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;

  List<Song> songs = Song.songs;
  List<Playlist> playlists = Playlist.playlists;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: const _CustomAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: Colors.white.withOpacity(0.3),
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        enableFeedback: false,
        currentIndex: current,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => current = index);
        },
        children: [
          _Home(songs: songs, playlists: playlists),
          const SongsScreen(),
          const Test(),
          const GreenPage(),
        ],
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({
    required this.songs,
    required this.playlists,
  });

  final List<Song> songs;
  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _DiscoverMusic(),
          _TredingMusic(songs: songs),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SectionHeader(title: 'Playlists'),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlists.length,
                  itemBuilder: ((context, index) {
                    return PlaylistCard(playlist: playlists[index]);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TredingMusic extends StatelessWidget {
  const _TredingMusic({
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SectionHeader(title: 'Trending Music'),
          ),
          const SizedBox(height: 20),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return SongCard(song: songs[index]);
                },
              ))
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(
            'Enjoy your favorite music',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            style: const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.grid_view_rounded),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.pitchfork.com/photos/618a8cc8c5f185b018cfa331/1:1/w_2000,h_2000,c_limit/Travis-Scott.jpeg'),
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
