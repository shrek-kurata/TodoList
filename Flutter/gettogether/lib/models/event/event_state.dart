import 'package:gettogether/models/user/user_id.dart';

class EventState {
  String _state;
  UserId _userId;
  EventState(this._state) : super();

  get state => _state;

  void join(int userId) => _updateUserAdd(userId);

  void cansel(int userId) => _updateUserRemove(userId);

  void _updateUserAdd(int userId) {}

  void _updateUserRemove(int userId) {}
}
