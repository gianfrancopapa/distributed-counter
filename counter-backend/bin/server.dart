import 'dart:async';
import 'package:counter_backend/counter_backend.dart';
import 'package:rxdart/subjects.dart';

class CounterService extends CounterServiceBase {
  var counter = 0.0;
  final counterStream = BehaviorSubject.seeded(0.0);

  @override
  Stream<Counter> getCounter(ServiceCall call, CounterRequest request) async* {
    await for (var value in counterStream) {
      yield Counter(value: value);
    }
  }

  @override
  Future<Counter> incrementCounter(ServiceCall call, Counter request) async {
    counterStream.add(++counter);
    return Counter(value: counter);
  }
}

void main(List<String> arguments) async {
  final server = Server([CounterService()]);
  await server.serve(port: 8080);
  print('Server running at localhost:${server.port}');
}
