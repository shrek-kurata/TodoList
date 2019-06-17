class Play {
  final PlayId playId;
  final SportName sportName;
  final String placeName;
  Play(this.playId, this.sportName, this.placeName);
}

enum SportName { Soccer, BasketBall, BaseBall }

class PlayId {
  final String value;
  PlayId(this.value);
}
