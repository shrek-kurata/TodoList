import 'package:gettogether/models/user/user.dart';
import 'package:rxdart/rxdart.dart';

const testId = 1;

class UserBloc {
  final User _user = User(testId);

  final BehaviorSubject<User> _user = BehaviorSubject<User>.seeded();

  get user => _user;

  

  
}
