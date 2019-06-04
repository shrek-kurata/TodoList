import 'package:gettogether/models/event/event.dart';
import 'package:rxdart/rxdart.dart';

class EventAdd {

}
class EventBloc {
  final Event _event = Event();

  final BehaviorSubject<List<Event>> _events =
      BehaviorSubject<List<Event>>.seeded([]);
  
}
