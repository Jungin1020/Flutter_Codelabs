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

  List<WordPair> favorites = [];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState =
        context.watch<MyAppState>(); //상태를 지속적으로 감시하고 변경될 때 UI도 자동으로 변경되는 메서드입니다
    final pair = appState.current; //참조를 끊기 위해 새로 만든 파라미터

    IconData icon; //로직을 이런 식으로도 쓸 수 있구나..
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair), //위젯 추출한 부분
            const SizedBox(height: 10.0),
            Row(
              mainAxisSize: MainAxisSize.min, //포함된 자식 컨텐트의 크기만큼 차지
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: const Text('Like'),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  //추출된 위젯
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); //앱의 현재 테마를 요청
    final style = theme.textTheme.displayMedium!.copyWith(
      //앱의 글꼴 테마에 접근
      color: theme.colorScheme.onPrimary, //기본색상으로 사용하기 적합한 색상을 정의
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel:
              "${pair.first} ${pair.second}", //스크린리더에 적합한 시멘틱 콘텐츠로 재정의
        ),
      ),
    );
  }
}
