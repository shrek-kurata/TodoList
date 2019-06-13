import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gettogether/domain/entity.dart';

class Play extends Entity {
  final PlayId id;
  final SportName sportName;

  Play({this.id, this.sportName})
      : assert(id != null),
        assert(sportName != null),
        super();

  factory Play.fromDocumentSnapShot(DocumentSnapshot docSnapShot) {
    var playId = PlayId(docSnapShot.documentID);
    return Play(id: playId, sportName: docSnapShot.data['sportName']);
  }

  factory Play.fromMap(Map data) {
    var playId = PlayId(data['id'] ?? '');
    return Play(id: playId, sportName: data['sport_name'] ?? '');
  }
}

class PlayId {
  final String value;
  const PlayId(this.value) : assert(value != null);
}

enum SportName { Soccer, Baseball, BasketBall }
