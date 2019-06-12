import 'package:gettogether/domain/play.dart';
import 'package:gettogether/domain/user.dart';

abstract class PlayRepository {
  Stream<List<Play>> get top;
  Stream<List<Play>> get latest;

  Future<Play> create(Play play) {}

  /// 主体Entityに書くものであるが、Repositoryのなかでどう切り離すのかわからない
  Future<Play> addUser(UserId userId, PlayId playId) {}
  Future<Play> removeUser(UserId userId, PlayId playId) {}

  /// infraとの接続として、shareという命名がいいのかが不安
  Future<Play> shareLine(Play play) {}
  Future<Play> shareFacebook(Play play) {}
  Future<Play> shareTwitter(Play play) {}
}
