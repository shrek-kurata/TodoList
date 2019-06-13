import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:gettogether/domain/play.dart';
import 'package:gettogether/domain/repository/PlayRepository.dart';
import 'package:gettogether/domain/user.dart';

class PlayBloc {
  // Blocでは、StreamControllerを作るらしい。
  final _valueController = StreamController<Play>();
  // 値を出すときは、StreamController
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

Widget playList() => StreamBuilder<Play>(
  stream: PlayBloc().value,
  builder: (BuildContext context, AsyncSnapshot<Play> snapshot) {
    if (!snapshot.hasData) return const Text('Loading...');
    return Text(snapshot.data.sportName.toString());
  }
);
