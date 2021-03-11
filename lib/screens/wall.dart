import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvid/screens/video_player.dart';

class Wall extends StatefulWidget {
  @override
  _WallState createState() => _WallState();
}

class _WallState extends State<Wall> {
  @override
  Widget build(BuildContext context) {
    final videos = context.watch<QuerySnapshot?>();
    List<QueryDocumentSnapshot> ll = videos!.docs;
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: ll.length,
      itemBuilder: (context, index) {
        dynamic user = ll[index].data();
        if (user['thumbnail'] == null)
          user['thumbnail'] =
              'https://homepages.cae.wisc.edu/~ece533/images/pool.png';
        if (user['url'] == null)
          user['url'] =
              'https://homepages.cae.wisc.edu/~ece533/images/pool.png';
        return GridTile(
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChewiePlayer(url: user['url'].toString())),
                );
              },
              child: Stack(
                children: [
                  Image.network(
                    user['thumbnail'],
                  ),
                  Text(
                    user['url'],
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
