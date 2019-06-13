import 'package:flutter/widgets.dart';
import 'package:gettogether/domain/apply_play.dart';
import 'package:gettogether/domain/entity.dart';

class User extends Entity {
  final UserId id;
  final String name;
  final List<ApplyPlay> applyEvents;

  User({@required this.id, @required this.name, this.applyEvents})
      : assert(id != null),
        assert(name != null),
        super();
}

// ValueObject dartの場合、propertyはvalueにする
class UserId {
  final String value;
  const UserId(this.value) : assert(value != null);
}
