import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp3player/screens/home_screen.dart';
import 'package:mp3player/screens/playlist_screen.dart';
import 'package:mp3player/screens/play_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mp3 Player',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        primaryColor: const Color.fromARGB(255, 233, 51, 60),
        canvasColor: const Color.fromARGB(255, 25, 25, 25),
        cardColor: Colors.white.withOpacity(0.7),
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/song', page: () => const PlayScreen()),
        GetPage(name: '/playlist', page: () => PlaylistScreen()),
      ],
    );
  }
}
