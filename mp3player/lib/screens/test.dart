import 'dart:convert';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("AssetManifest.json"),
        builder: (context, item) {
          if (item.hasData) {
            Map? jsonMap = json.decode(item.data!);
            List? songs = jsonMap?.keys
                .where((element) => element.endsWith(".mp3"))
                .toList();

            return ListView.builder(
              itemCount: songs?.length,
              itemBuilder: (context, index) {
                var path = songs![index].toString();
                var title = path.split("/").last.toString();
                title = title.replaceAll("%20", "");
                title = title.split(".").first;

                return Container(
                  margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ListTile(
                    title: Text(title),
                    subtitle: Text("path: $path"),
                    leading: const Icon(
                      Icons.audiotrack,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No songs in the Assets'),
            );
          }
        },
      ),
    );
  }
}
