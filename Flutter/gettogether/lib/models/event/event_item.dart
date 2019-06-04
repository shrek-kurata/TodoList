import 'package:gettogether/models/event/event_id.dart';
import 'package:gettogether/models/event/event_state.dart';

enum Sport { Soccer, BaseBall, BasketBall, Tennis }

class EventItem {
  EventId _eventId;
  Sport _sport;
  String _playAt;
  String _place;
  EventState _state;
  int playTime;

  EventItem(this._state) : super();

  void setPlayAt(String playAt) {
    this._playAt = playAt;
  }

  void setPlace(String place) {
    this._place = place;
  }

  changeState(String state, int userId) {
    switch (state) {
      case "join":
        this._state.join(userId);
        break;
      case "canse":
        this._state.cansel(userId);
        break;
      default:
        break;
    }
  }

  EventId get eventId => _eventId;
  String get place => _place;
  String get playAt => _playAt;

  String sportName() {
    switch (this._sport) {
      case Sport.Soccer:
        return "サッカー";
      case Sport.BaseBall:
        return "野球";
      case Sport.Tennis:
        return "テニス";
      case Sport.BasketBall:
        return "バスケットボール";
      default:
        return "Gettogether!";
    }
  }

  void updateState(EventState state, int userId) {
    this._state = state;
  }
}

