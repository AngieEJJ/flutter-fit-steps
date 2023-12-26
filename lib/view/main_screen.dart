import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'Fit Steps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 130),
          const Text('Select a profile',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              context.go('/ejscreen');
            },
            borderRadius: BorderRadius.circular(70),
            child: const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/1.jpeg'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              context.go('/jsscreen');
            },
            borderRadius: BorderRadius.circular(70),
            child: const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/2.jpeg'),
            ),
          )
        ]),
      ),
    );
  }
}
