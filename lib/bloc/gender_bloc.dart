import 'dart:async';

enum gender { male, female }

class GenderBloc {
  bool female;

  //stream for the data
  final _stateStreamController = StreamController<bool>.broadcast(onListen: () {
    print('hye');
  });
  StreamSink<bool> get genderSink => _stateStreamController.sink;
  Stream<bool> get genderStream => _stateStreamController.stream;

  void dispose() {
    _stateStreamController.close();
  }
}
