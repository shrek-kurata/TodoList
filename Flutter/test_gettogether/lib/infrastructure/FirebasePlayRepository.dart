import 'package:gettogether/domain/play.dart';
import 'package:gettogether/domain/repository/PlayRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gettogether/domain/user.dart';

class FirebasePlayRpository extends PlayRepository {
  Stream<List<Play>> get top {
    return Firestore.instance
        .collection('plays')
        .snapshots()
        .map((QuerySnapshot querySnapShot) {
      querySnapShot.documents.map<Play>((doc) {
        return fromDocumentSnapShot(doc);
      }).toList();
    });
  }

  Stream<List<Play>> get latest {
    return Firestore.instance
        .collection('plays')
        .snapshots()
        .map((QuerySnapshot querySnapShot) {
      querySnapShot.documents.map<Play>((doc) {
        return fromDocumentSnapShot(doc);
      }).toList();
    });
  }

  Future<Play> create(Play play) {
    return Firestore.instance
        .collection('plays')
        .add({'sport_name': play.sportName}).then((DocumentReference docRef) {
      docRef.snapshots().map<Play>((doc) {
        return fromDocumentSnapShot(doc);
      });
    });
  }

  Future<Play> addUser(UserId userId, PlayId playId) {
    return Firestore.instance
        .collection('plays')
        .document(playId.value)
        .collection('users')
        .add({'id': userId}).then((DocumentReference docRef) {
      docRef.snapshots().map<Play>((doc) {
        return fromDocumentSnapShot(doc);
      });
    });
  }

  Future<Play> removeUser(UserId userId, PlayId playId) {
    return Firestore.instance
        .collection('plays')
        .document(playId.value)
        .collection('users')
        .add({'id': userId}).then((DocumentReference docRef) {
      docRef.snapshots().map<Play>((doc) {
        return fromDocumentSnapShot(doc);
      });
    });
  }

  /// Converter
  List<Play> fromQuerySnapShot(QuerySnapshot querySnapShot) {
    return querySnapShot.documents
        .map<Play>((doc) => fromDocumentSnapShot(doc))
        .toList();
  }

  Play fromDocumentSnapShot(DocumentSnapshot docSnapShot) {
    var playId = PlayId(docSnapShot.documentID);
    return Play(id: playId, sportName: docSnapShot.data['sportName']);
  }

  /// [Share]まだやってない

  Future<Play> shareFacebook(Play play) {
    return Future(() => Play(id: PlayId('da'), sportName: SportName.Baseball));
  }

  Future<Play> shareTwitter(Play play) {
    return Future(() => Play(id: PlayId('da'), sportName: SportName.Baseball));
  }
}
