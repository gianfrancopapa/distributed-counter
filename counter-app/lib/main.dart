import 'package:flutter/material.dart';
import 'package:counter_backend/counter_backend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ClientChannel channel;
  late CounterServiceClient stub;
  late ResponseStream<Counter> counterStream;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    stub = CounterServiceClient(channel);

    counterStream = stub.getCounter(CounterRequest(id: '1'));
    counterStream.listen((Counter counter) {
      setState(() {
        _counter = counter.value.toInt();
      });
    });
  }

  @override
  void dispose() {
    counterStream.cancel();
    channel.shutdown();
    super.dispose();
  }

  void _sendIncrementCounter() {
    stub.incrementCounter(Counter(value: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendIncrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
