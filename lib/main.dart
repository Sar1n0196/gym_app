import 'package:flutter/material.dart';
import 'package:gym_app/main_scroll_area.dart';
import 'package:gym_app/top_bar.dart';

Map<String, Color> appColors = {
  "background": Color.fromARGB(255, 0, 0, 0),
  "main": Color.fromARGB(255, 0, 0, 0),
  "light": Color.fromARGB(255, 255, 255, 255),
  "highlight": Color.fromARGB(255, 255, 255, 255),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Page number
  int bottomSelectedIndex = 0;

  // Controller for multiple pages
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  // swipe to change pages
  void pageSwipe(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  // User pressed bottom par
  void navigationBarPressed(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  // PageView for multiple pages
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageSwipe(index);
      },
      children: const <Widget>[
        ScrollArea(),
        Center(
          child: Text('Working on dis shit'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //   LocalDatabase().addExercise("penkki");
    // LocalDatabase().addExercise("mave");
    //LocalDatabase().addRep("penkki", "3", "1232", "daxdte");
    //LocalDatabase().addRep("mave", "111", "sdsdsd", "daxdsdte");

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: appColors["background"],
            appBar: TopBar(
              appBar: AppBar(),
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events),
                    label: "PRs",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.fitness_center),
                    label: 'Exercises',
                  ),
                ],
                currentIndex: bottomSelectedIndex,
                selectedItemColor: Colors.orange,
                onTap: (index) {
                  navigationBarPressed(index);
                }),
            body: buildPageView()));
  }
}
