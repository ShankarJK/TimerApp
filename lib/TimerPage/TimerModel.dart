import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'TimerModel.g.dart';

class TimerModel = _TimerModelBase with _$TimerModel;

abstract class _TimerModelBase with Store {

  @observable
  int sec = 0;
  Stopwatch stopwatch = Stopwatch();

  @observable
  String status = "Start";

  StreamController<int> durationSec = StreamController.broadcast();
  StreamController<int> durationMin = StreamController.broadcast();
  Timer? time;

  void setSeconds({required int sec}) {
    this.sec = sec;
  }

  void setStatus({required String status}) {
    this.status = status;
  }
}
