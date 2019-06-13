import 'package:gettogether/application/service.dart';
import 'package:gettogether/domain/play.dart';
import 'package:gettogether/domain/repository/PlayRepository.dart';
import 'package:gettogether/infrastructure/FirebasePlayRepository.dart';

class PlayService extends Service {
  static PlayService _instance;
  PlayService._internal();
  factory PlayService() {
    if (_instance != null) _instance = PlayService._internal();
    return _instance;
  }

  void post(Play play) {
    FirebasePlayRpository().create(play);
  }
}
