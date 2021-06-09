import 'dart:async';

enum counterAction { increment, decrement }

class AgeBloc {
  static int age;

  //stream for the data
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get ageSink => _stateStreamController.sink;
  Stream<int> get ageStream => _stateStreamController.stream;

  //stream for the events
  final _eventStreamController = StreamController<counterAction>();
  StreamSink<counterAction> get eventSink => _eventStreamController.sink;
  Stream<counterAction> get eventStream => _eventStreamController.stream;

  AgeBloc() {
    age = 20;
    eventStream.listen((event) {
      if (event == counterAction.increment) {
        age++;
      } else if (event == counterAction.decrement) {
        age--;
      }
      ageSink.add(age);
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
