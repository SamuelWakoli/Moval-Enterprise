import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double tileFontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Account"),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext ctx) {
            return [
              PopupMenuItem(
                child: Text("Edit profile image"),
              ),
              PopupMenuItem(
                child: Text("Edit username"),
              ),
            ];
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 28.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/item.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            const ListTile(
              title: Text(
                "Username\nEmail@gmail.com",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 18.0),
            ListTile(
              title: Text(
                "Purchased Products",
                style: TextStyle(fontSize: tileFontSize),
              ),
            ),
            ListTile(
              title: Text(
                "Share app",
                style: TextStyle(fontSize: tileFontSize),
              ),
            ),
            ListTile(
              title: Text(
                "Report issue",
                style: TextStyle(fontSize: tileFontSize),
              ),
            ),
            ListTile(
              title: Text(
                "Terms of service",
                style: TextStyle(fontSize: tileFontSize),
              ),
            ),
            ListTile(
              title: Text(
                "About us",
                style: TextStyle(fontSize: tileFontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
