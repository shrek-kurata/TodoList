import 'package:gettogether/domain/entity.dart';

class Play extends Entity {
  final PlayId id;
  final SportName sportName;

  Play({this.id, this.sportName})
      : assert(id != null),
        assert(sportName != null),
        super();
}

class PlayId {
  final String value;
  const PlayId(this.value) : assert(value != null);
}

enum SportName { Soccer, Baseball, BasketBall }
