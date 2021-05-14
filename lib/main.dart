import 'dart:async';

import 'package:flutter/material.dart';
import 'package:question_answer/class.dart';
import 'package:question_answer/widget/route_widget.dart';

void main() {
  var hash = Factory.toString();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DEMO",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MainApp(),
    );
  }
}


class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _HomePage(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ああああああ"),
        ),
        body: LayoutBuilder(
          builder: (context,constraints){
            if (constraints.maxWidth > 700){
              return _rowLayout(context);
            } else {
              return _columnLayout(context);
            }
          },
        )
       ),
    );
  }

  Widget _rowLayout(context){
    return Center(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          _WidgetA(),
          _WidgetB(),
          _WidgetC(),
          RouteWidget.imagePickRoute(context)
        ],
      ),
    );
  }

  Widget _columnLayout(context){
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:<Widget> [
          _WidgetA(),
          _WidgetB(),
          _WidgetC(),
          RouteWidget.imagePickRoute(context)
        ],
      ),
    );
  }

}

class _HomePage extends StatefulWidget {
  _HomePage({Key key, this.child,}):super(key:key);

  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();

  static _HomePageState of(BuildContext context,{bool rebuild = true}){
    if(rebuild){
      return (context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget>()).data;
    }
    return (context.getElementForInheritedWidgetOfExactType<_MyInheritedWidget>().widget as _MyInheritedWidget).data;
  }
}

class _HomePageState extends State<_HomePage> {
  int counter = 0;
  int add = 0;

   void incrementCounter(){
     setState(() {
       counter++;
     });
   }

   void addCounter(){
     setState(() {
       add += 6;
     });
   }

  @override
  Widget build(BuildContext context) {
    return _MyInheritedWidget(child: widget.child, data: this);
  }
}

class _MyInheritedWidget extends InheritedWidget{
  _MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
}):super(key:key,child: child);

  final _HomePageState data;

  @override
  bool updateShouldNotify(_MyInheritedWidget oldWidget){
    return true;
  }
}

class _WidgetA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _HomePageState state = _HomePage.of(context);
    return Text(
        "${state.counter}",
        style: Theme.of(context).textTheme.display1,
    );
  }
}

class _WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _HomePageState state = _HomePage.of(context);
    return Text("${state.add}");
  }
}

class _WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _HomePageState state = _HomePage.of(context);
    return GestureDetector(
      onTap: (){
        state.incrementCounter();
        state.addCounter();
      },
      child: Text("BUTTON"),
    );
  }
}

class _WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}



