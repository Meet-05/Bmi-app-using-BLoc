import 'dart:async';
import './brain.dart';

enum counterAction { increment, decrement }

class WeightBloc {
  static int weight;

  //stream for the data
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get weightSink => _stateStreamController.sink;
  Stream<int> get weightStream => _stateStreamController.stream;

  //stream for the events
  final _eventStreamController = StreamController<counterAction>();
  StreamSink<counterAction> get eventSink => _eventStreamController.sink;
  Stream<counterAction> get eventStream => _eventStreamController.stream;

  WeightBloc() {
    weight = 30;
    eventStream.listen((event) {
      if (event == counterAction.increment) {
        weight++;
      } else if (event == counterAction.decrement) {
        weight--;
      }
      weightSink.add(weight);
      BmiBrain.weight = weight;
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
