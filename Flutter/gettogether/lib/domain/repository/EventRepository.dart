import 'package:gettogether/domain/event.dart';
import 'package:gettogether/domain/user.dart';

abstract class EventRepository {
  Future<List<Event>> get top;
  Future<List<Event>> get latest;

  /// 主体Entityに書くものであるが、Repositoryのなかでどう切り離すのかわからない
  Future<Event> apply(User user) {}
  Future<Event> cansel(User user) {}
}
