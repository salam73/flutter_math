

import 'dart:async';
import 'package:intl/intl.dart';

int? a = 5;

int b = a!;
int? c;
int multiply(int a, [int b = 5, int? c]) {
  return a*b*(c??1);
}
void main(){
  print('${ DateFormat('yMd').format(DateTime.now())} Start');
  int timeLeftSec = 5;
  int timeLeftMilSec = 5000;
  Timer.periodic(const Duration(milliseconds: 1), (timer) {
    if (timeLeftMilSec > 0) {
      print('${DateFormat('M:s:SS').format(DateTime.now())} seconds... $timeLeftMilSec');
      timeLeftMilSec--;

    } else {
      print('${DateTime.now()} ms done');
      timer.cancel();
    }
  });
  /* String? salam;
  print(salam!.toUpperCase());
  print(multiply(4,2));
  print(c ?? 3);*/


  Iterable<int> naturalsTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield k++;
    }
  }

  print(naturalsTo(5)); // Returns an iterable with [0, 1, 2, 3, 4].

  Iterable<int> doubleNaturalsTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield* [k, k];
      k++;
    }
  }

  Iterable<int> naturalTo(int n) sync* {
    int k = 0;
    while (k < n) {
      yield k=k+5;
    }
  }
  var f=naturalTo(40);
  //f=f.toList();

  int d=6;
  print(d is String);

}