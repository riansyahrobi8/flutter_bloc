import 'dart:async';

enum LengthEvents { add_length_green, add_length_purple }

class LengthBloc {
  double _lengthGreen = 100.0;
  double _lengthPurple = 100.0;

  LengthBloc() {
    _eventLengthController.stream.listen(_mapEventToStream);
  }

  // definiskan controller
  StreamController<LengthEvents> _eventLengthController =
      StreamController<LengthEvents>();

  // definiskan sink event
  StreamSink<LengthEvents> get eventSinkGreen => _eventLengthController.sink;
  StreamSink<LengthEvents> get eventSinkPurple => _eventLengthController.sink;

  // definisikan state
  StreamController _stateGreenController = StreamController();
  StreamController _statePurpleController = StreamController();

  // definiskan sink state
  StreamSink get _stateSinkGreen => _stateGreenController.sink;
  StreamSink get _stateSinkPurple => _statePurpleController.sink;

  // definisikan stream
  Stream get stateGreenStream => _stateGreenController.stream;
  Stream get statePurpleStream => _statePurpleController.stream;

  void _mapEventToStream(LengthEvents lengthEvents) {
    if (lengthEvents == LengthEvents.add_length_green) {
      _lengthGreen += 10;
      _stateSinkGreen.add(_lengthGreen);
    } else {
      _lengthPurple += 10;
      _stateSinkPurple.add(_lengthPurple);
    }
  }

  void dispose() {
    _eventLengthController.close();
    _stateGreenController.close();
    _statePurpleController.close();
  }
}
