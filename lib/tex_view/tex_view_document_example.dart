import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class TeXViewFontsExamples extends StatelessWidget {
  final TeXViewRenderingEngine renderingEngine;

  TeXViewFontsExamples(
      {Key? key, this.renderingEngine = const TeXViewRenderingEngine.katex()})
      : super(key: key);


  String problemStringFormat(String problem) {
    problem = problem.replaceAll('\f', '\\f');
    problem = problem.replaceAll('l', '\\l');
    problem = problem.replaceAll('s', '\\s');
    problem = problem.replaceAll('\r', '\\r');
    problem = problem.replaceAll(' ', '*');

    return problem;
  }

  String problemStringFormatArabic(String problem) {
    problem = problem.replaceAll('0', '٠');
    problem = problem.replaceAll('1', '١');
    problem = problem.replaceAll('2', '٢');
    problem = problem.replaceAll('3', '٣');
    problem = problem.replaceAll('4', '٤');
    problem = problem.replaceAll('5', '٥');
    problem = problem.replaceAll('6', '٦');
    problem = problem.replaceAll('7', '٧');
    problem = problem.replaceAll('8', '٨');
    problem = problem.replaceAll('9', '٩');
    return problem;
  }

  String problemStringFormatEnglish(String problem) {
    problem = problem.replaceAll('٠', '0');
    problem = problem.replaceAll('١', '1');
    problem = problem.replaceAll('٢', '2');
    problem = problem.replaceAll('٣', '3');
    problem = problem.replaceAll('٤', '4');
    problem = problem.replaceAll('٥', '5');
    problem = problem.replaceAll('٦', '6');
    problem = problem.replaceAll('٧', '7');
    problem = problem.replaceAll('٨', '8');
    problem = problem.replaceAll('٩', '9');
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
    {
      'prob': '\frac{\frac{45}{\sqrt{6 \left(6 \sqrt{4}-8\right)+1}}+9}{9}',
      'ans': 2
    },
    {'prob': '5 \sqrt{\frac{\left(6 \sqrt{4}-6\right)^2}{4}-5}-9', 'ans': 1},
    {
      'prob':
          '\sqrt{12-\frac{\frac{72}{13-\left(\frac{20-4}{8}\right)^2}+8}{2}}',
      'ans': 2
    },
    {
      'prob': '\frac{24}{18-7 \sqrt{\frac{36}{6 \sqrt{\frac{20}{5}}-3}}}',
      'ans': 6
    },
    {
      'prob': '14-\frac{72}{72-7 \left(17-\frac{42-5 \sqrt{4}}{4}\right)}',
      'ans': 6
    },
    {
      'prob': '\frac{8 \sqrt{4 \left(\left(6-2\right)^2-8\right)-7}-10}{6}',
      'ans': 5
    },
    {
      'prob': '\frac{9 \left(18-\frac{7 \sqrt{48+1}+5}{6}\right)-9}{9}',
      'ans': 8
    },
    {
      'prob': '49=\left(\frac{30-\frac{6 \sqrt{7 x+7}+3}{5}}{3}\right)^2',
      'ans':6
    },
 {
      'prob': '9=\left(\frac{\frac{36}{\left(\frac{7 \left(18-x\right)-4}{8}\right)^2}+2}{2}\right)^2',
      'ans':14
    },
 {
      'prob': '4=8-\left(\frac{16-\frac{\left(\frac{x+2}{2}\right)^2-7}{7}}{5}\right)^2',
      'ans':12
    },
  {
      'prob': '5=\frac{\left(\frac{18}{\left(\frac{\frac{\frac{\frac{x+20}{7}+8}{2}+6}{2}+9}{3}\right)^2-16}\right)^2+6}{2}',
      'ans':8
    },
  ];
  String? question;
  int? answer;
  Map<dynamic, dynamic>? problem;

  arabicFormat() {
    for (var element in problemsList) {
      element.update(
          'prob', (value) => problemStringFormatArabic(element['prob']));
    }
    // problem=problemsList[Random().nextInt(problemsList.length)];
    question = problem!['prob'];
    answer = problem!['ans'];
  }

  englishFormat() {
    for (var element in problemsList) {
      element.update(
          'prob', (value) => problemStringFormatEnglish(element['prob']));
    }
    // problem=problemsList[Random().nextInt(problemsList.length)];
    question = problem!['prob'];
    answer = problem!['ans'];
  }

  getRandomQuestion() {
    problem = problemsList[Random().nextInt(problemsList.length)];
    question = problem!['prob'];
    answer = problem!['ans'];
  }

  bool check = true;

  @override
  Widget build(BuildContext context) {

    double m = MediaQuery.of(context).size.width / 22;

    List<Map> arabicProblemList = [];
    for (var element in problemsList) {
      if (check) {
        // print(check);
        element.update('prob', (value) => problemStringFormat(element['prob']));
      }

      arabicProblemList.add(element);
    }

    print('========');
    print(arabicProblemList);
    // problemsList.add({'prob':'hello','ans':6});

    if (check) {
      problem = problemsList[Random().nextInt(problemsList.length)];
      question = problem!['prob'];
      answer = problem!['ans'];
    }
    check = false;

    return StatefulBuilder(
          builder: (BuildContext context, updateFunction) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      child: TeXView(
                          renderingEngine: renderingEngine,
                          child: TeXViewDocument(r'$$'
                              '$question'
                              r'$$', style: TeXViewStyle(
                              fontStyle: TeXViewFontStyle(
                                fontSize: m.round(),))
                             // backgroundColor: Colors.green)
                          ),
                          loadingWidgetBuilder: (context) => Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    CircularProgressIndicator(),
                                    Text("Rendering...")
                                  ],
                                ),
                              )),
                    ),
                  ),
                ),
                Text(answer!.toString()),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          updateFunction(() => getRandomQuestion());
                        },
                        child: const Text('update')),
                    ElevatedButton(
                        onPressed: () {
                          updateFunction(() => arabicFormat());
                        },
                        child: const Text('arabicFormat')),
                    ElevatedButton(
                        onPressed: () {
                          updateFunction(() => englishFormat());
                        },
                        child: const Text('englishFormat')),
                  ],
                )
              ],
            );
          },


        /*  TeXView(
          renderingEngine: renderingEngine,
          child: TeXViewDocument(r'$$'
              '$question2'
              r'$$'),
          loadingWidgetBuilder: (context) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text("Rendering...")
                  ],
                ),
              )),*/
        );
  }
}
