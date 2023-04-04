import 'dart:async';

import 'package:timer/TimerPage/TimerModel.dart';

class TimerVM extends TimerModel {
  TimeVM(){
    durationSec.add(0);
    durationMin.add(0);
  }
  Future checkTime() async {
    await Future.delayed(const Duration(minutes: 99));
    stopwatch.reset();
    setStatus(status: "Start");
    time?.cancel();
    dispose();
  }

  void dispose() async {
    await durationSec.done;
    await durationMin.done;
  }

  Future timeCounter() async {
    if (status == "Start") {
      stopwatch.start();
      time = Timer.periodic(const Duration(seconds: 1), (timers) {
        int currentMilliseconds = stopwatch.elapsedMilliseconds;
        var currentSec = Duration(milliseconds: currentMilliseconds);
        var currentMin = Duration(milliseconds: currentMilliseconds);
        if (currentSec.inSeconds.toString() != "60"){
           durationSec.add(currentSec.inSeconds);
        }
        else if (currentSec.inSeconds.toString() == "60"){
            durationSec.add(currentSec.inSeconds%60);
           durationMin.add(currentMin.inMinutes);
        }
        checkTime();
        setStatus(status: "Pause");
      });
    } else if (status == "Pause") {
      stopwatch.stop();
      setStatus(status: "Start");
      time?.cancel();
    }
  }
}
