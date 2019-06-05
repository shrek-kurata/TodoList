import 'package:gettogether/domain/event.dart';
import 'package:gettogether/domain/user.dart';

abstract class EventRepository {
  Future<List<Event>> get top;
  Future<List<Event>> get latest;

  Future<Event> create(Event event) {}

  /// 主体Entityに書くものであるが、Repositoryのなかでどう切り離すのかわからない
  Future<Event> addUser(User user) {}
  Future<Event> removeUser(User user) {}

  /// infraとの接続として、shareという命名がいいのかが不安
  Future<Event> shareLine(Event event) {}
  Future<Event> shareFacebook(Event event) {}
  Future<Event> shareTwitter(Event event) {}
}
