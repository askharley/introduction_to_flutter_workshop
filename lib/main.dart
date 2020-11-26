import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:toggle_bar/toggle_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Our Workshop App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  MaterialColor _color = Colors.pink;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void setColor(int index) {
    switch (index) {
      case 0:
        return setState(() {
          _color = Colors.pink;
        });
      case 1:
        return setState(() {
          _color = Colors.purple;
        });
      case 2:
        return setState(() {
          _color = Colors.blue;
        });
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          FlatButton(
            onPressed: () => _decrementCounter(),
            child:
                Text('-', style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Toggle(color: _color, handleColorChange: setColor),
          SizedBox(height: 10),
          CounterDisplay(
            counter: _counter,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.plus_one),
      ),
    );
  }
}

class Toggle extends StatelessWidget {
  final MaterialColor color;
  final Function handleColorChange;

  Toggle({this.color, this.handleColorChange});

  @override
  Widget build(BuildContext context) {
    return ToggleBar(
        selectedTabColor: color,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.black,
        labels: ["Pink", "Purple", "Blue"],
        onSelectionUpdated: (int index) => handleColorChange(index));
  }
}

class CounterDisplay extends StatelessWidget {
  final int counter;

  CounterDisplay({this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
