import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopwatchScreen> {
  Timer? _timer;
  bool _isRunning = false;
  int _time = 0;
  final List<String> _laptimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _laptimes.clear();
    _time = 0;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int min = _time ~/ 60; //분
    int seconds = _time % 60; //초
    String sec = '$seconds'.padLeft(2, '0');

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        backgroundColor: Colors.green[100],
        title: const Text('Track Time',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$min',
                  style: const TextStyle(fontSize: 80),
                ),
                const Text('min', style: TextStyle(fontSize: 40)),
                const SizedBox(width: 20),
                Text('$sec', style: const TextStyle(fontSize: 70)),
                const Text('sec', style: TextStyle(fontSize: 40)),
              ],
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: ListView(
                children: _laptimes.map((e) => Text(e)).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _reset();
                    });
                  },
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _clickButton();
                    });
                  },
                  backgroundColor: Colors.grey[100],
                  child: _isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: const Center(
                                child: Text(
                                  'Well Done!',
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'ok',
                                      style: TextStyle(fontSize: 17),
                                    ))
                              ],
                            )),
                      );
                    },
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.done)),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
