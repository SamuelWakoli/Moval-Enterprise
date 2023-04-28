import 'package:flutter/material.dart';
import 'package:moval/pages/about_us.dart';
import 'package:moval/pages/edit_profile_img.dart';
import 'package:moval/pages/edit_username.dart';
import 'package:moval/pages/purchased_products.dart';
import 'package:moval/pages/report_issue.dart';
import 'package:moval/pages/terms_of_service.dart';
import 'package:moval/utils/navigation.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double tileFontSize = 18.0;

  // TODO:
  // String userEmail = FirebaseAuth.instance.currentUser!.email.toString();
  // String username = FirebaseAuth.instance.currentUser!.displayName.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Account"),
        actions: [
          PopupMenuButton(onSelected: (value) {
            switch (value) {
              case 0: // Edit profile image
                nextPage(context: context, page: const EditProfileImg());
                break;
              case 1: // Edit username
                nextPage(context: context, page: const EditUsername());
                break;
            }
          }, itemBuilder: (BuildContext ctx) {
            return const [
              PopupMenuItem(
                value: 0,
                child: Text("Edit profile image"),
              ),
              PopupMenuItem(
                value: 1,
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
              leading: Icon(
                Icons.dashboard_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                nextPage(context: context, page: const PurchasedProducts());
              },
            ),
            ListTile(
              title: Text(
                "Share app",
                style: TextStyle(fontSize: tileFontSize),
              ),
              leading: Icon(
                Icons.share,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Report issue",
                style: TextStyle(fontSize: tileFontSize),
              ),
              leading: Icon(
                Icons.report_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                nextPage(context: context, page: const ReportIssue());
              },
            ),
            ListTile(
              title: Text(
                "Terms of service",
                style: TextStyle(fontSize: tileFontSize),
              ),
              leading: Icon(
                Icons.policy_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                nextPage(context: context, page: const TermsOfService());
              },
            ),
            ListTile(
              title: Text(
                "About us",
                style: TextStyle(fontSize: tileFontSize),
              ),
              leading: Icon(
                Icons.info_outline_rounded,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                nextPage(context: context, page: const AboutUs());
              },
            ),
          ],
        ),
      ),
    );
  }
}
