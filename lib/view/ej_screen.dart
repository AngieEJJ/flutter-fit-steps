import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/widget/profile_widget.dart';

class EjScreen extends StatelessWidget {
  const EjScreen({super.key});

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
        title: const Text('EJJ', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: Column(
        children: [
          const ProfileWidget(
            imgPath: 'assets/1.jpeg',
            currentWeight: '41kg',
            goalWeight: '44kg',
            status: '40% 달성중',
            statusRate: 50,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.go('/stopwatch');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              minimumSize: MaterialStateProperty.all(Size(150, 50)),
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
