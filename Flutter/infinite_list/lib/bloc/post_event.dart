import 'package:equatable/equatable.dart';
// Packageを継承する基底クラス
abstract class PostEvent extends Equatable {}

//メソッドをoverrideする。
class Fetch extends PostEvent {
  @override
  String toString() => 'Fetch';
}
