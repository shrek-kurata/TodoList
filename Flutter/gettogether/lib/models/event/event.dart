import 'package:gettogether/models/event/event_item.dart';
class Event {
  final List<EventItem> _items = <EventItem>[];
  Event() : super();
  Event.clone(Event event) {
    _items.addAll(event._items);
  }

  EventItem findById(int eventId) {
    return _items.firstWhere((el) => el.id == eventId);
  }
  
  get items => _items;
}
