import 'dart:async';

import 'package:gettogether/domain/play.dart';

class PlayBloc {
  final _valueController = StreamController<Play>();
  Stream<Play> get value => _valueController.stream;

  void post({SportName sportName}) {
    
  }

  void dispose() {
    _valueController.close();
  }
}
