import 'package:flutter/widgets.dart';
import 'package:gettogether/domain/entity.dart';
import 'package:gettogether/domain/event.dart';

class User extends Entity {
  final UserId id;
  final String name;
  final List<Event> applyingEvents;

  User({@required this.id, @required this.name, this.applyingEvents})
      : assert(id != null),
        assert(name != null),
        super();
}

// ValueObject dartの場合、propertyはvalueにする
class UserId {
  final String value;
  const UserId(this.value) : assert(value != null);
}
