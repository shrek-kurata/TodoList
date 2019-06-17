import 'dart:async';

import 'package:gettogether/models/play.dart';
import 'package:gettogether/services/play_list.dart';

abstract class PlayListEvent {}

class LatestEvent extends PlayListEvent {}

class PlayListBloc {
  PlayListBloc() {
    _eventController.stream.listen(_playList);
  }
  StreamController<List<Play>> _playListController =
      StreamController<List<Play>>();

  final _eventController = StreamController<PlayListEvent>();

  Sink<PlayListEvent> get playListEvenet => _eventController.sink;

  StreamSink<List<Play>> get _playListSink => _playListController.sink;
  Stream<List<Play>> get playListStream => _playListController.stream;

  _playList(PlayListEvent event) async {
    if (event is LatestEvent) {
      List<Play> playList = await playListService.getPlayList;
      _playListSink.add(playList);
    }
  }

  dispose() {
    
  }
}
