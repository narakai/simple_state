import 'package:flutter/material.dart';
import 'package:simple_state/notify_consumer.dart';
import 'package:simple_state/simple_model.dart';

import 'change_notifier_provider.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ChangeNotifierProvider<SimpleModel>(
          data: SimpleModel(),
          //需要在新的context里面
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                NotifyConsumer<SimpleModel>(builder: (context, value) {
                  return Text(
                    value.count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                }),
                const SizedBox(height: 20.0),
                InkWell(
                  child: const Text(
                    'UP',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    //获取共享model，进行数据自增操作
                    ChangeNotifierProvider.of<SimpleModel>(context).increase();
                  },
                ),
              ],
            );
          }),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
