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
        return Play(id: doc.data['id'], sportName: doc.data['sportNane']);
      }).toList();
    });
  }

  Stream<List<Play>> get latest {
    return Firestore.instance
        .collection('plays')
        .snapshots()
        .map((QuerySnapshot querySnapShot) {
      querySnapShot.documents.map<Play>((doc) {
        return Play(id: doc.data['id'], sportName: doc.data['sportName']);
      });
    });
  }

  Future<Play> create(Play play) {
    return Firestore.instance
        .collection('plays')
        .add({'sport_name': play.sportName}).then((DocumentReference docRef) {
      docRef.snapshots().map<Play>((doc) {
        return Play(id: doc.data['id'], sportName: doc.data['sportName']);
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
        return Play(sportName: doc.data['sportName'], id: doc.data['id']);
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
        return Play(sportName: doc.data['sportName'], id: doc.data['id']);
      });
    });
  }

  Future<Play> shareFacebook(Play play) {
    return Future(() => Play(id: PlayId('da'), sportName: SportName.Baseball));
  }
  Future<Play> shareTwitter(Play play) {
    return Future(() => Play(id: PlayId('da'), sportName: SportName.Baseball));
  }
}
