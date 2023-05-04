import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Future Builder",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  List<Map<String, dynamic>> students = [
    {
      "name": "Shidqi",
      "nim": "2006099",
    },
    {
      "name": "Sarah",
      "nim": "2006050",
    },
    {
      "name": "Ujang",
      "nim": "2006029",
    },
    {
      "name": "Iman",
      "nim": "2006399",
    },
    {
      "name": "Maman",
      "nim": "2006299",
    },
    {
      "name": "Peri",
      "nim": "2006199",
    },
    {
      "name": "Asep",
      "nim": "2006123",
    },
    {
      "name": "Ucup",
      "nim": "2006039",
    },
    {
      "name": "Wati",
      "nim": "2006799",
    },
    {
      "name": "Gunar",
      "nim": "2006699",
    },
  ];

  Future<List<Map<String, dynamic>>> getStudents() async {
    return Future.delayed(
      Duration(seconds: 3),
      () {
        return students;
      },
    );
  }

  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              var tempData = snapshot.data;
              inspect(tempData);
              return ListView.builder(
                itemCount: tempData!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        tempData[index]["name"],
                      ),
                      subtitle: Text(
                        tempData[index]["nim"],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("data"),
              );
            }
          }
        },
      ),
    );
  }
}
