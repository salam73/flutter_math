import 'package:circular_countdown/circular_countdown.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:fluttermath/flutter_stop_watch.dart';
import 'package:fluttermath/home_page.dart';
import 'package:fluttermath/home_student.dart';
import 'package:fluttermath/mathjax.dart';
import 'package:fluttermath/stopwatch/main_page.dart';
import 'package:fluttermath/stopwatch/stopwatch_page.dart';
import 'package:fluttermath/tex_view/MyLatexApp.dart';
import 'package:fluttermath/tex_view/tex_view_document_example.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart' as ttm;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الرياضيات',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //HomePage()
          // HomeStudent()
          //  DemoPage(),
      MyMath(),
     // MyLatexApp()
      // TeXViewFontsExamples(),

    );
  }
}

/*class MyEdu extends StatelessWidget {
   MyEdu({Key? key}) : super(key: key);
var g='\epsilon = \frac 2 {3 + 2}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:   CaTeX('''$g'''),
        ),
      ),
    );
  }
}*/

class MyMath extends StatelessWidget {
  MyMath({Key? key}) : super(key: key);
  int _start = 10;
  int _current = 10;

  @override
  Widget build(BuildContext context) {


    var gen2 = '\frac{3 \left(18-9\right)-9}{6}';
    // gen2=gen2.split('').reversed.join();
    gen2 = gen2.replaceAll('\f', '\\f');
    gen2 = gen2.replaceAll('l', '\\l');
    gen2 = gen2.replaceAll('s', '\\s');
    gen2 = gen2.replaceAll('\r', '\\r');
    gen2 = gen2.replaceAll(' ', '.');

    // print(string2Raw(gen2));
    final stopwatch = Stopwatch();
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 12;

    void onEnd() {
      print('onEnd');
    }

    final int _duration = 10;
    final CountDownController _controller = CountDownController();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('مرحبا بالرياضيات'),
      ),
      // backgroundColor: Colors.grey[900],
      body: Column(

        children:  [
          StopwatchPage(),

         /* StopWatchTimerPage(),
          const SizedBox(
            height: 0,1
          ),*/

            TeXViewFontsExamples(),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
