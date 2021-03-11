import 'package:flutter/material.dart';

class MyVideos extends StatefulWidget {
  @override
  _MyVideosState createState() => _MyVideosState();
}

class _MyVideosState extends State<MyVideos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   //item builder type is compulsory.
    //   itemBuilderType: PaginateBuilderType.listView, //Change types accordingly
    //   itemBuilder: (index, context, documentSnapshot) => Card(
    //     child: ListTile(
    //       // onTap: () {
    //       //   Navigator.push(
    //       //     context,
    //       //     MaterialPageRoute(
    //       //       builder: (context) => VideoPlayerApp(
    //       //           url: documentSnapshot.data()['url'].toString()),
    //       //     ),
    //       //   );
    //       // },
    //       leading: CircleAvatar(child: Icon(Icons.person)),
    //       title: Text('da'),
    //       subtitle: Column(
    //         children: [
    //           Text(documentSnapshot.id),
    //           Text(documentSnapshot.data()!['url'].toString()),
    //         ],
    //       ),
    //     ),
    //   ),

    //   // orderBy is compulsory to enable pagination
    //   query:
    //       FirebaseFirestore.instance.collection('videos').orderBy('createdAt'),
    //   // to fetch real-time data
    //   isLive: true,
    // );
    return Container();
  }
}
