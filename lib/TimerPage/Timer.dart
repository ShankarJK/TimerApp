import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/TimerPage/TimerVM.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TimerPage extends StatelessWidget {
  TimerPage({super.key});
  final TimerVM _instance = TimerVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fbff),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Timer",
            style: GoogleFonts.poppins(),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              // backgroundColor: Color(0xffe8f4fc),
              child: CircleAvatar(
                  radius: 96,
                  backgroundColor: const Color(0xff51b3ff),
                  child: CircleAvatar(
                      backgroundColor: const Color(0xfff7fcff),
                      radius: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StreamBuilder<int>(
                              stream: _instance.durationMin.stream,
                              builder: (context, snapshot) {
                                return Text(
                                    style: GoogleFonts.poppins(fontSize: 22),
                                    snapshot.data != 0
                                        ?snapshot.data.toString()
                                        : "00");
                              }),
                          Text(style: GoogleFonts.poppins(fontSize: 22), ":"),
                          StreamBuilder<int>(
                              stream: _instance.durationSec.stream,
                              builder: (context, snapshot) {
                                return Text(
                                    style: GoogleFonts.poppins(fontSize: 22),
                                    snapshot.data.toString() == null
                                        ? "00"
                                        : snapshot.data.toString());
                              }),
                        ],
                      )
                      // Observer(builder: (context) {
                      //   return
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [

                      //       Observer(builder: (context) {
                      //         return Text(
                      //             style: GoogleFonts.poppins(fontSize: 22),
                      //             _instance.sec <= 9
                      //                 ? "0${_instance.sec}"
                      //                 : _instance.sec.toString());
                      //       }),
                      //       Text(style: GoogleFonts.poppins(fontSize: 22), ":"),
                      //       Observer(builder: (context) {
                      //         return Text(
                      //             style: GoogleFonts.poppins(fontSize: 22),
                      //             _instance.sec <= 9
                      //                 ? "0${_instance.sec}"
                      //                 : _instance.sec.toString());
                      //       })
                      //     ],
                      //   );
                      // }),
                      )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      _instance.timeCounter();
                    },
                    child: Text(
                        style: const TextStyle(fontSize: 16),
                        _instance.status));
              }),
            ],
          )
        ],
      ),
    );
  }
}
