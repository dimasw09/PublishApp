import 'package:flutter/material.dart';
import 'package:mvvm_news_app/screens/general_screen.dart';
import 'package:mvvm_news_app/screens/health_screen.dart';
import 'package:mvvm_news_app/screens/science_screen.dart';
import 'package:mvvm_news_app/screens/technology_screen.dart';
import 'package:mvvm_news_app/screens/top_headlines_screen.dart';
import 'package:mvvm_news_app/screens/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PubLish',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/tabScreen': (context) => const TabsScreen(),
        '/general': (context) => const GeneralScreen(),
        '/health': (context) => const HealthScreen(),
        '/technology': (context) => const TechnologyScreen(),
        '/science': (context) => const ScienceScreen(),
        '/topHeadlines': (context) => const TopHeadlinesScreen(),
      },
    );
  }
}

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "PubLish",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[700]!,
                  Colors.indigo[900]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.green,
            ),
            isScrollable: true,
            tabs: [
              Tab(text: "General"),
              Tab(text: "Health"),
              Tab(text: "Technology"),
              Tab(text: "Science"),
              Tab(text: "Top headlines"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GeneralScreen(),
            HealthScreen(),
            TechnologyScreen(),
            ScienceScreen(),
            TopHeadlinesScreen(),
          ],
        ),
      ),
    );
  }
}