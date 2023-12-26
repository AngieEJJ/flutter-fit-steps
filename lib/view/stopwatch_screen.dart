import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopwatchScreen> {
  Timer? _timer;
  //아무것도 없을 때 null 이기 때문에 물음표를 붙인다.
  bool _isRunning = false;
  int _time = 0;
  List<String> _laptimes = [];

  // <필요한 기능>: 타이머 기능, 시작, 플레이, 중지, 취소 (cancle이라는 기본 메서드 있음)
  // 1) 플레이: 플레이 버튼 실행시 타이머가 돌아가고, 다시 클릭시 꺼져야 한다.
  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  //2) 시작, 중지 (타이머 기능 생성)
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

  //3) 화면이 종료될 떄 타이머 파괴 필요 -> 타이머가 살아있다면 캔슬한다.
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
        backgroundColor: Colors.green[100],
        title: const Text('Track Walking Time',
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
                  style: const TextStyle(fontSize: 90),
                ),
                const Text('min', style: TextStyle(fontSize: 50)),
                const SizedBox(width: 20),
                Text('$sec', style: const TextStyle(fontSize: 75)),
                const Text('', style: TextStyle(fontSize: 50)),
              ],
            ),
            SizedBox(
              width: 100,
              height: 200,
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
                  backgroundColor: Colors.amber[200],
                  child: const Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _clickButton();
                    });
                  },
                  backgroundColor: Colors.blue,
                  child: _isRunning
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: Center(
                                child: Text(
                                  'Well Done!',
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('ok'))
                              ],
                            )),
                      );
                    },
                    backgroundColor: Colors.green[300],
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
