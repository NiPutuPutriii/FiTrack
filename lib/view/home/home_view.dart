import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/img/Workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/img/Workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/img/Workout3.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
    {
      "name": "HIIT",
      "image": "assets/img/Workout1.png",
      "kcal": "300",
      "time": "45",
      "progress": 0.8
    },
    {
      "name": "Strength Training",
      "image": "assets/img/Workout2.png",
      "kcal": "0",
      "time": "40",
      "progress": 0.0
    },
    {
      "name": "Jump Rope",
      "image": "assets/img/Workout3.png",
      "kcal": "0",
      "time": "30",
      "progress": 0.0
    },
    {
      "name": "Cardio",
      "image": "assets/img/Workout1.png",
      "kcal": "0",
      "time": "35",
      "progress": 0.0
    },
    {
      "name": "Lean Ab Workout",
      "image": "assets/img/Workout2.png",
      "kcal": "0",
      "time": "40",
      "progress": 0.0
    },
    {
      "name": "Cardio",
      "image": "assets/img/Workout3.png",
      "kcal": "0",
      "time": "40",
      "progress": 0.0
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Programs'),
      ),
      body: ListView.builder(
        itemCount: lastWorkoutArr.length,
        itemBuilder: (context, index) {
          final workout = lastWorkoutArr[index];
          return ListTile(
            leading: Image.asset(
              workout['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(workout['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${workout['time']} mins'),
                Text('${workout['kcal']} kcal'),
                LinearProgressIndicator(
                  value: workout['progress'],
                ),
              ],
            ),
            onTap: () {
              // Add your onTap logic here
              print('Tapped on ${workout['name']}');
            },
          );
        },
      ),
    );
  }
}