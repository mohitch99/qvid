import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference videoCollection =
      FirebaseFirestore.instance.collection('videos');

  // Future updateUserData(String name, String email) async {
  //   return await userCollection.doc(uid).set({
  //     'name': name,
  //     'email': email,
  //   });
  // }
  // List<Video> _videoList(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc){
  //     return Video(
  //       title: doc.data()
  //     );
  //   });
  // }

  Stream<QuerySnapshot> get videos {
    return videoCollection.snapshots();
  }
}
