import 'dart:async';
import 'package:flutter/material.dart';

import 'button_watch.dart';

class StopWatchTimerPage extends StatefulWidget {
  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}

class _StopWatchTimerPageState extends State<StopWatchTimerPage> {
  static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  Timer? timer;

  bool countDown =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reset();
  }

  void reset(){
    if (countDown){
      setState(() =>
      duration = countdownDuration);
    } else{
      setState(() =>
      duration = Duration());
    }
  }

  void startTimer(){
    timer = Timer.periodic(Duration(milliseconds: 1),(_) => addTime());
  }

  void addTime(){
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final milliseconds = duration.inMilliseconds + addSeconds;
      if (milliseconds < 0){
        timer?.cancel();
      } else{
        duration = Duration(milliseconds: milliseconds);

      }
    });
  }

  void stopTimer({bool resets = true}){
    if (resets){
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) =>  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTime(),
          SizedBox(height: 80,),
          buildButtons()
        ],
      ),

  );

  Widget buildTime(){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours =twoDigits(duration.inHours);
    final minutes =twoDigits(duration.inMinutes.remainder(60));
    final seconds =twoDigits(duration.inSeconds.remainder(60));
    final milliseconds =twoDigits(duration.inMilliseconds.remainder(1000));
    return Wrap(
alignment: WrapAlignment.end,
      children: [
        Row(
          //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTimeCard(time: hours, header:'HOURS'),
              SizedBox(width: 8,),
              buildTimeCard(time: minutes, header:'MINUTES'),
              SizedBox(width: 8,),
              buildTimeCard(time: seconds, header:'SECONDS'),
              SizedBox(width: 8,),
              buildTimeCard(time: milliseconds, header:'milliseconds'),

            ]
        ),
       // SizedBox(width: 38,),
      ],
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(18),

            child: Text(
              time, style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black,fontSize: 50),),
          ),
          SizedBox(height: 44,),
          Text(header,style: TextStyle(color: Colors.black45)),
        ],
      );

  Widget buildButtons(){
    final isRunning = timer == null? false: timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || isCompleted
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
            text:'STOP',
            onClicked: (){
              if (isRunning){
                stopTimer(resets: false);
              }
            }),
        SizedBox(width: 12,),
        ButtonWidget(
            text: "CANCEL",
            onClicked: stopTimer
        ),
      ],
    )
        : ButtonWidget(
        text: "Start Timer!",
        color: Colors.black,
        backgroundColor: Colors.white,
        onClicked: (){
          startTimer();
        });

  }
}