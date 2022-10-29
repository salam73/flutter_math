import 'dart:async';

import 'package:flutter/material.dart';

String formatTime(int milliseconds) {
  var secs = milliseconds / 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds";
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch? _stopwatch;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 120), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  void handleStartStop() {
    if (_stopwatch!.isRunning) {
      _stopwatch!.stop();
    } else {
      _stopwatch!.start();
    }



    setState(() {});
  }

  void handleRest() {

    _stopwatch!.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(formatTime(_stopwatch!.elapsedMilliseconds),
                style: const TextStyle(fontSize: 20.0)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: handleStartStop,
                child: Text(_stopwatch!.isRunning ? 'Stop' : 'Start')),
            ElevatedButton(
                onPressed: handleRest,
                child: Text( 'Reset')),
          ],
        ),
      ],
    );
  }
}
