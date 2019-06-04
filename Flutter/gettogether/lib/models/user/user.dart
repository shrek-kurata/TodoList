import 'package:gettogether/models/user/user_id.dart';

class User {
  String _name;
  UserId _userId;
  User(this._userId) : super();

  get name => _name;
}
