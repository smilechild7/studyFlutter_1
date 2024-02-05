import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int pomodorosCount = 0;
  late Timer timer;
  void onTick(Timer timer) {
    setState(() {
      if (isRunning) {
        totalSeconds -= 1;
        if (totalSeconds <= 0) {
          totalSeconds = twentyFiveMinutes;
          pomodorosCount += 1;
          isRunning = false;
          timer.cancel();
        }
      }
    });
  }

  void onStartPressed() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void reset() {
    setState(() {
      isRunning = false;
      timer.cancel();
      totalSeconds = twentyFiveMinutes;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_outline_rounded
                            : Icons.play_circle_outline_rounded,
                        size: 120,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    IconButton(
                      onPressed: reset,
                      icon: const Icon(
                        Icons.restore,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "pomodoros",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$pomodorosCount",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
