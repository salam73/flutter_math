import 'package:flutter/material.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:fluttermath/home_page.dart';
import 'package:fluttermath/home_student.dart';
import 'package:provider/provider.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //HomePage()
          // HomeStudent()
          //  DemoPage(),
         // MyMath(),
      MyMath(),
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
  const MyMath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double m = MediaQuery.of(context).size.width / 22;

    var gen2 = '10=\left(\frac{7 \left(\left(\frac{\frac{5 \left(\frac{\frac{64}{16-x}+4}{6}\right)^2+4}{4}+4}{5}\right)^2+2\right)-36}{3}\right)^2+6';
     gen2=gen2.replaceAll('\f', '\\f');
     gen2=gen2.replaceAll('l', '\\l');
     gen2=gen2.replaceAll('s', '\\s');
     gen2=gen2.replaceAll('\r', '\\r');

 // print(string2Raw(gen2));






    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('hello math'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Math.tex(
              gen2,
              textStyle: TextStyle(color: Colors.green, fontSize: m),
              onErrorFallback: (err) => Container(
                color: Colors.black,
                child: Text(err.messageWithType,
                    style: TextStyle(color: Colors.white)),
              ),
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gen =
        '9=\frac{\left(\frac{\left(\frac{x+10}{2}\right)^2-7}{6}\right)^2-4}{5}';

    print('this is g=$gen');
    return Center(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints(maxWidth: 800),
          child: ChangeNotifierProvider(
            create: (context) => TextEditingController(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Consumer<TextEditingController>(
                    builder: (context, controller, _) => TextField(
                      controller: controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Input TeX equation here',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Flutter Math's output",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(10),
                            child: Consumer<TextEditingController>(
                                builder: (context, controller, _) {
                              print(controller.value.text);
                              gen = controller.value.text;
                              print(gen);
                              return SelectableMath.tex(
                                controller.value.text,
                                textStyle: const TextStyle(fontSize: 22),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
