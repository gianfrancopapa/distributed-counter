import 'dart:async';
import 'dart:io';
import 'package:counter_backend/counter_backend.dart';
import 'package:redis/redis.dart';
import 'package:rxdart/subjects.dart';

late final RedisConnection conn;
late final RedisConnection pubSubConn;
late final Command command;
late final Command pubSubCommand;
late final PubSub pubSub;
late final BehaviorSubject counterStream;

class CounterService extends CounterServiceBase {
  @override
  Stream<Counter> getCounter(ServiceCall call, CounterRequest request) async* {
    await for (var value in counterStream) {
      yield Counter(value: value);
    }
  }

  @override
  Future<Counter> incrementCounter(ServiceCall call, Counter request) async {
    await command.send_object(['INCR', 'counter']);
    command.send_object(['PUBLISH', 'counterUpdate', 'counter']);
    return Counter(value: 0.0);
  }
}

void main(List<String> arguments) async {
  conn = RedisConnection();
  command = await conn.connect('localhost', 6379);

  pubSubConn = RedisConnection();
  pubSubCommand = await pubSubConn.connect('localhost', 6379);
  pubSub = PubSub(pubSubCommand);
  pubSub.subscribe(["counterUpdate"]);

  final counterValue = await command.send_object(['GET', 'counter']);

  counterStream = BehaviorSubject.seeded(
    counterValue is String ? double.parse(counterValue) : 0.0,
  );

  pubSub.getStream().handleError((e) => print("$e")).listen((message) async {
    final counterValue = await command.send_object(['GET', 'counter']);
    counterStream.add(
      counterValue is String ? double.parse(counterValue) : 0.0,
    );
  });

  final server = Server([CounterService()]);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  await server.serve(port: port);

  print('Server running at localhost:${server.port}');
}
