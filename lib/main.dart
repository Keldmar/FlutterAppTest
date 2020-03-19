import 'package:flutter/material.dart';
import 'package:flutter_app_test/main_block.dart';

final String mainText = 'Hey there';
final double mainFontSize = 40;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: bloc.newColors,
            builder: (context, AsyncSnapshot<List<Color>> snapshot) {
              List<Color> colors = snapshot.data ?? bloc.getNewColors();
              return _getContainerWithColor(colors);
            }));
  }

  Widget _getContainerWithColor(List<Color> list) {
    return GestureDetector(
        onTap: _changeColor,
        child: AnimatedContainer(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: list)),
          duration: Duration(seconds: 1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[_getSimpleText()],
            ),
          ),
        ));
  }

  Widget _getSimpleText() {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          mainText,
          style: TextStyle(
            fontSize: mainFontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.white,
          ),
        ),
        // Solid text as fill.
        Text(
          mainText,
          style: TextStyle(
            fontSize: mainFontSize,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  void _changeColor() {
    bloc.loadNewColors();
  }
}
