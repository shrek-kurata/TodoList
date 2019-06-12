import 'dart:async';

import 'package:gettogether/domain/play.dart';
import 'package:gettogether/domain/repository/PlayRepository.dart';
import 'package:gettogether/domain/user.dart';

class PlayBloc {
  final _valueController = StreamController<Play>();
  Stream<Play> get value => _valueController.stream;

  void post({SportName sportName}) async {
    PlayRepository playRepository;
    Play play = Play(id: PlayId('one'), sportName: sportName);
    Play newPlay = await playRepository.create(play);
    // すぐにListに反映するために、sinkしてる。
    _valueController.sink.add(newPlay);
  }

  void join(UserId userId, PlayId playId) async {
    PlayRepository playRepository;
    await playRepository.addUser(userId, playId);
    // 今のところaddする予定はない
  }

  void cansel(UserId userId, PlayId playId) async {
    PlayRepository playRepository;
    await playRepository.removeUser(userId, playId);
    // 今のところaddする予定はない。
  }

  void dispose() {
    _valueController.close();
  }
}
