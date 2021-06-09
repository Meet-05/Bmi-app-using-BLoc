import 'dart:async';
import './brain.dart';

class SliderBloc {
  static double height;

  //stream for the data
  final _stateStreamController = StreamController<double>.broadcast();
  StreamSink<double> get heightSink => _stateStreamController.sink;
  Stream<double> get heightStream => _stateStreamController.stream;

  SliderBloc() {
    heightStream.listen((event) {
      BmiBrain.height = event;
    });
  }

  void dispose() {
    _stateStreamController.close();
  }
}
