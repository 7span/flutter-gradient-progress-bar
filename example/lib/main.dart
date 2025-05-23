import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Progress Indicator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Progress Indicator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0.0;
  Timer? timer;
  bool isIncreasing = true;

  @override
  void initState() {
    super.initState();
    startAutoProgress();
  }

  void startAutoProgress() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (isIncreasing) {
          value += 0.01;
          if (value >= 1.0) {
            value = 1.0;
            isIncreasing = false;
          }
        } else {
          value -= 0.01;
          if (value <= 0.0) {
            value = 0.0;
            isIncreasing = true;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GradientProgressIndicator(const [
                Color(0xffF68270),
                Color(0xffF1C358),
                Color(0xffEFDE62),
                Color(0xffE5F3BE),
                Color(0xffCDE8F1),
                Color(0xffDDC5EE),
                Color(0xffF2E300),
              ], value),
              const SizedBox(height: 20),
              Center(
                child: ColorfulCircularProgressIndicator(
                  colors: [Colors.blue, Colors.red, Colors.amber, Colors.green],
                  strokeWidth: 5,
                  indicatorHeight: 40,
                  indicatorWidth: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(timer?.isActive == true ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          if (timer?.isActive == true) {
            timer?.cancel();
          } else {
            startAutoProgress();
          }
          setState(() {});
        },
      ),
    );
  }
}
