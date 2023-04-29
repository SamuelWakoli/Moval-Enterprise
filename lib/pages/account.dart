import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moval/pages/about_us.dart';
import 'package:moval/pages/edit_profile_img.dart';
import 'package:moval/pages/edit_username.dart';
import 'package:moval/pages/purchased_products.dart';
import 'package:moval/pages/report_issue.dart';
import 'package:moval/pages/terms_of_service.dart';
import 'package:moval/utils/navigation.dart';
import 'package:share/share.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double tileFontSize = 18.0;

  String userprofileUrl =
      FirebaseAuth.instance.currentUser!.photoURL.toString();

  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();
  String username = FirebaseAuth.instance.currentUser!.displayName.toString();

  /// shares data to other apps
  _onShareData(context, text, subject) async {
    final RenderBox box = context.findRenderObject();
    {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

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
      body: ListView(
        children: [
          const SizedBox(height: 28.0),
          CachedNetworkImage(
            imageUrl: userprofileUrl,
            fit: BoxFit.fill,
            errorWidget: (cx, url, downloadProgress) {
              return Icon(
                Icons.account_circle_outlined,
                size: 120,
                color: Theme.of(context).primaryColor,
              );
            },
          ),
          const SizedBox(height: 14.0),
          ListTile(
            title: Text(
              "$username\n$userEmail",
              style: const TextStyle(fontSize: 20),
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
            onTap: () async {
              _onShareData(
                  context,
                  "https://play.google.com/store/apps/details?id=com.moval_enterprise.moval",
                  'Moval Enterprise App Link');
            },
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
          ListTile(
            title: Text(
              "Sign out",
              style: TextStyle(fontSize: tileFontSize),
            ),
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text("Sign Out"),
                      content: const Text("Are you sure you want to sign out?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              FirebaseAuth.instance.signOut();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            },
                            child: const Text("Okay")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                            },
                            child: const Text("Cancel")),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
