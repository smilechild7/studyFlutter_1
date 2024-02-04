import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Fix applied here
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  void onClicked() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          title: const Text("Home"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Large Title ",
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: 30,
      ),
    );
  }
}
