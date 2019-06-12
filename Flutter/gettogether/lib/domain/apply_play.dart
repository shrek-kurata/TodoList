import 'package:gettogether/domain/entity.dart';
import 'package:gettogether/domain/user.dart';

class ApplyPlay extends Entity {
  final List<User> users;

  ApplyPlay(this.users)
      : assert(users != null),
        super();
}
