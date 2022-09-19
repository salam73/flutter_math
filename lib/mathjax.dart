import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import "dart:math";

class MathJax extends StatelessWidget {
  MathJax({Key? key}) : super(key: key);

  String problemStringFormat(String problem) {
    problem = problem.replaceAll('\f', '\\f');
    problem = problem.replaceAll('l', '\\l');
    problem = problem.replaceAll('s', '\\s');
    problem = problem.replaceAll('\r', '\\r');
    return problem;
  }

  List<Map> problemsList = [
    {
      'prob': '\frac{10-\frac{16}{4 \sqrt{9 \left(10-4\right)-5}-24}}{2}',
      'ans': 3
    },
    {'prob': '2 \sqrt{3 \left(54-9 \sqrt{4+21}\right)-2}-2', 'ans': 8},
    {
      'prob':
          '\frac{40-2 \left(5 \left(16-\frac{64}{14-\frac{48}{8}}\right)-36\right)}{4}',
      'ans': 8
    },
    {
      'prob':
          '\frac{14}{\sqrt{13-\frac{54}{42-4 \left(\frac{10+18}{7}+5\right)}}}',
      'ans': 7
    },
    {
      'prob': '10-\frac{7 \left(\frac{56}{\sqrt{7 6+7}}-2\right)+6}{8}',
      'ans': 4
    },
    {'prob': '\frac{25}{\sqrt{5 \sqrt{8 \left(4 4-10\right)+1}-10}}', 'ans': 5},
    {
      'prob':
          '\frac{45}{\left(\frac{25-\frac{3 \left(8 2-7\right)-7}{5}}{7}\right)^2}',
      'ans': 5
    },
    {'prob': '\frac{64}{16-\frac{56-\frac{6 \sqrt{5 5}+2}{4}}{6}}', 'ans': 8},
    {
      'prob': '\frac{\sqrt{9 \left(15-\frac{8 5+8}{8}\right)}+54}{7}-1',
      'ans': 8
    },
    {'prob': '\frac{20}{8-\frac{\frac{36}{24-6 \sqrt{6+3}}+14}{5}}', 'ans': 5},
  ];

  @override
  Widget build(BuildContext context) {
    double m = MediaQuery.of(context).size.width / 22;

    // gen2=gen2.split('').reversed.join();

    List<Map> myAnsers = [];
    for (var element in problemsList) {
      element.update('prob', (value) => problemStringFormat(element['prob']));

      myAnsers.add(element);
    }

    print(myAnsers[Random().nextInt(myAnsers.length)]['prob']);
    // problemsList.add({'prob':'hello','ans':6});
    //   print(problemsList);

    var gen2 = problemsList[Random().nextInt(problemsList.length)]['prob'];

    // gen2 = gen2.replaceAll(' ', '.');

    return Center(
      child: Math.tex(
        gen2,
        textStyle: TextStyle(color: Colors.blue, fontSize: m),
        onErrorFallback: (err) => Container(
          color: Colors.black,
          child:
              Text(err.messageWithType, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
