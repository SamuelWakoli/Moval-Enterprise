import 'package:flutter/material.dart';

import '../pages/cart.dart';
import '../pages/categories.dart';
import '../pages/home.dart';
import '../utils/navigation.dart';
import 'drawer_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
