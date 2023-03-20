import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:set_color/set_color.dart';
import 'package:set_color/set_color_viewmodel.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = ref.watch(setColorViewModel);
    return Scaffold(
      appBar: AppBar(backgroundColor: color,
        title:const Text('home'),
      ),
      body: Center(
        child: TextButton(
          child:const Text("テーマカラー設定"),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => setColor()),
            );
          },
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
