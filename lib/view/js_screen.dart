import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/widget/profile_widget.dart';

class JsScreen extends StatelessWidget {
  const JsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text('JS PARK',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: Column(
        children: [
          const ProfileWidget(
            imgPath: 'assets/2.jpeg',
            currentWeight: '81kg',
            goalWeight: '78kg',
            status: '60% 달성중',
            statusRate: 70,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.go('/stopwatch');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              minimumSize: MaterialStateProperty.all(const Size(150, 50)),
            ),
            child: const Text(
              '산책 시작하기',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
