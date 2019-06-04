import 'package:gettogether/domain/entity.dart';

class Event extends Entity {
  final EventId id;
  final SportName sportName;

  Event({this.id, this.sportName})
      : assert(id != null),
        assert(sportName != null),
        super();
}

class EventId {
  final String value;
  const EventId(this.value) : assert(value != null);
}

enum SportName { Soccer, Baseball, BasketBall }
