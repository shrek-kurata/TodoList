import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gettogether/models/play.dart';

class PlayListService {
  final Firestore _db = Firestore.instance;

  Future<List<Play>> get getPlayList async {
    CollectionReference ref = _db.collection('plays');
    QuerySnapshot querySnapshot = await ref.getDocuments();
    return querySnapshot.documents.map((DocumentSnapshot doc) {
      Play(doc.data['playId'], doc.data['sportName'], doc.data['placeName']);
    }).toList();
  }
}

final PlayListService playListService = PlayListService();
