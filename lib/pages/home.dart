import 'package:flutter/material.dart';

import '../widgets/home_page_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
            homePageCard(context: context),
          ],
        ),
      ],
    );
  }
}
