import 'package:flutter/widgets.dart';
import 'package:gettogether/bloc/event_bloc.dart';

class EventProvider extends InheritedWidget {
  final EventBloc eventBloc;
  EventProvider({Key key, EventBloc eventBloc, Widget child})
      : eventBloc = eventBloc ?? EventBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static EventBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(EventProvider) as EventProvider)
          .eventBloc;
}
