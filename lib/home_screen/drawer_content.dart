import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moval/pages/help_center.dart';

import '../pages/account.dart';
import '../pages/cart.dart';
import '../pages/orders.dart';
import '../pages/quiz_answers.dart';
import '../pages/suggestion.dart';
import '../utils/navigation.dart';

ListView drawerContent({required context}) {
  double menuTitleSize = 18.0;
  String userprofileUrl =
      FirebaseAuth.instance.currentUser!.photoURL.toString();
  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();
  String username = FirebaseAuth.instance.currentUser!.displayName.toString();

  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CircleAvatar(
          radius: 84,
          backgroundColor: Colors.white,
          child: Image.asset("assets/logo.png"),
        ),
      ),
      const SizedBox(width: 12.0),
      const Padding(
        padding: EdgeInsets.only(bottom: 24.0),
        child: ListTile(
          title: Text(
            "Moval Enterprise Limited",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        child: Divider(
          color: Theme.of(context).primaryColor,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 54,
              width: 54,
              child: CachedNetworkImage(
                imageUrl: userprofileUrl,
                fit: BoxFit.fill,
                errorWidget: (cx, url, downloadProgress) {
                  return Icon(
                    Icons.account_circle_outlined,
                    size: 36,
                    color: Theme.of(context).primaryColor,
                  );
                },
              ),
            ),
          ),
          title: Text(
            "Account",
            style: TextStyle(fontSize: menuTitleSize),
          ),
          subtitle: Text(
            "$userEmail\n$username",
          ),
          onTap: () => nextPage(context: context, page: const AccountPage()),
        ),
      ),
      ListTile(
        leading: Icon(
          Icons.shopping_cart_outlined,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: menuTitleSize),
        ),
        onTap: () => nextPage(context: context, page: const CartPage()),
      ),
      ListTile(
        leading: Icon(
          Icons.content_copy_outlined,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        title: Text(
          "Orders",
          style: TextStyle(fontSize: menuTitleSize),
        ),
        onTap: () => nextPage(context: context, page: const OrdersPage()),
      ),
      ListTile(
        leading: Icon(
          Icons.question_answer_outlined,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        title: Text(
          "Q&A",
          style: TextStyle(fontSize: menuTitleSize),
        ),
        onTap: () => nextPage(context: context, page: const QuizAnswers()),
      ),
      ListTile(
        leading: Icon(
          Icons.bubble_chart_outlined,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        title: Text(
          "Suggestion",
          style: TextStyle(fontSize: menuTitleSize),
        ),
        onTap: () => nextPage(context: context, page: const SuggestionPage()),
      ),
      ListTile(
        leading: Icon(
          Icons.headset_mic_outlined,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
        title: Text(
          "Help Center",
          style: TextStyle(fontSize: menuTitleSize),
        ),
        onTap: () => nextPage(context: context, page: const HelpCenter()),
      ),
    ],
  );
}
