import 'package:flutter/material.dart';
import 'package:moval/pages/cart.dart';
import 'package:moval/pages/categories.dart';
import 'package:moval/pages/home.dart';
import 'package:moval/utils/navigation.dart';

import 'home_screen/drawer_content.dart';

/// started on 23Apr 18:38 2023
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Moval Enterprise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Image.asset("assets/logo.png"),
            ),
            const SizedBox(width: 12.0),
            Text(widget.title),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () =>
                nextPage(context: context, page: const CategoriesPage()),
            icon: Icon(
              Icons.category_outlined,
              color: Theme.of(context).primaryColor,
            ),
            tooltip: "Categories",
          ),
          IconButton(
            onPressed: () => nextPage(context: context, page: const CartPage()),
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Theme.of(context).primaryColor,
            ),
            tooltip: "Cart",
          )
        ],
      ),
      body: const HomePage(),
      drawer: Drawer(
        child: drawerContent(context: context),
      ),
    );
  }
}
