import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Provider로 감싸줍니다
      create: (BuildContext context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  WordPair current = WordPair.random(); //MyAppState가 가진 변수들는 상태 관리를 받게 됩니다

  void getNext() {
    current = WordPair.random(); //새로운 랜덤단어 한 쌍을 만듭니다
    notifyListeners(); //MyApp에게 알림을 보내는 역할을 합니다
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState =
        context.watch<MyAppState>(); //상태를 지속적으로 감시하고 변경될 때 UI도 자동으로 변경되는 메서드입니다
    return Scaffold(
      body: Column(
        children: [
          const Text('A Random AWESOME Idea:'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
            onPressed: () {
              debugPrint('button pressed!');
              appState.getNext();
            },
            child: const Text('Next'),
          )
        ],
      ),
    );
  }
}
