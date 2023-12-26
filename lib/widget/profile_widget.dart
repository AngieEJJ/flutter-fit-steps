import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imgPath;
  final String currentWeight;
  final String goalWeight;
  final String status;
  final double statusRate;

  const ProfileWidget({
    Key? key,
    required this.imgPath,
    required this.currentWeight,
    required this.goalWeight,
    required this.status,
    required this.statusRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(imgPath),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('현재 체중',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(currentWeight,
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(width: 2, height: 48, color: Colors.black26),
                  const SizedBox(width: 10),
                  Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('목표 체중',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(goalWeight, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: statusRate,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
