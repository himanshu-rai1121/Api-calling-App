import 'package:flutter/material.dart';
import 'pages/overview_page.dart';
import 'pages/performance_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Example App'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Overview',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 50),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 400,
                  child: const OverviewPage()),
              const Text(
                'Performance',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 40),
              ),
              Container(
                  alignment: Alignment.center,
                  width: 450,
                  height: 500,
                  child: const PerformancePage())
            ],
          ),
        ],
      )),
    );
  }
}
