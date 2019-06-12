import 'package:gettogether/domain/play.dart';
import 'package:gettogether/domain/user.dart';

abstract class PlayRepository {
  Future<List<Play>> get top;
  Future<List<Play>> get latest;

  Future<Play> create(Play play) {}

  /// 主体Entityに書くものであるが、Repositoryのなかでどう切り離すのかわからない
  Future<Play> addUser(User user) {}
  Future<Play> removeUser(User user) {}

  /// infraとの接続として、shareという命名がいいのかが不安
  Future<Play> shareLine(Play play) {}
  Future<Play> shareFacebook(Play play) {}
  Future<Play> shareTwitter(Play play) {}
}
