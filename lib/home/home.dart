import 'package:flutter/material.dart';
import 'package:filipino_cuisinero/utils/auth.dart';

import 'package:filipino_cuisinero/login/login.dart';
import 'package:filipino_cuisinero/recipes/recipes.dart';
import 'package:filipino_cuisinero/favorites/favorites.dart';
import 'package:filipino_cuisinero/profile/profile.dart';
import 'package:filipino_cuisinero/shared/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: AuthUser().userStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            } else if (snapshot.hasData) {
              return const HomeScreenDynamic();
            } else {
              return const LoginScreen();
            }
          }),
    );
  }
}

class HomeScreenDynamic extends StatefulWidget {
  const HomeScreenDynamic({Key? key}) : super(key: key);

  @override
  State<HomeScreenDynamic> createState() => _HomeScreenDynamicState();
}

class _HomeScreenDynamicState extends State<HomeScreenDynamic> {
  final List<Widget> screens = [
    const Recipes(),
    const Favorites(),
    const Profile()
  ];
  final colors = [Colors.green, Colors.red, Colors.brown];

  int currentScreenIndex = 0;
  bool searchActive = false;
  final Widget appBar = const Row(
    children: [],
  );

  late Widget currentAppBar = appBar;

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      IconButton(
        icon: const Icon(Icons.search, color: Colors.grey),
        onPressed: () {
          setState(() {
            searchActive = true;

            currentAppBar = Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black87,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(() {
                        currentAppBar = appBar;
                        searchActive = false;
                      });
                    }),
                const Expanded(
                  child: TextField(
                    maxLength: 50,
                    decoration: InputDecoration(
                      hintText: 'Search Recipes',
                      counterText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          });
        },
      )
    ];

    return Scaffold(
      appBar: (currentScreenIndex != 2)
          ? AppBar(
              backgroundColor: Colors.grey.shade50,
              elevation: 0,
              title: currentAppBar,
              actions: actions,
            )
          : null,
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          selectedFontSize: 12,
          selectedItemColor: colors[currentScreenIndex],
          currentIndex: currentScreenIndex,
          onTap: (index) => setState(() {
                searchActive = false;
                currentAppBar = appBar;
                currentScreenIndex = index;
              }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_dining),
              activeIcon: Icon(Icons.local_dining, color: Colors.green),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              activeIcon: Icon(Icons.favorite, color: Colors.red),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              activeIcon: Icon(Icons.account_circle, color: Colors.brown),
              label: ('Account'),
            )
          ]),
    );
  }
}
