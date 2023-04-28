import 'package:flutter/material.dart';

Widget productDetailsCard(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
          height: 220,
          child: Stack(children: [
            Image.asset(
              'assets/item.jpg',
              fit: BoxFit.fitHeight,
            ),
            IconButton(
                onPressed: () {
                  // TODO: fill screen with current image
                },
                tooltip: "Maximize",
                icon: Icon(
                  Icons.fit_screen_outlined,
                  color: Theme.of(context).primaryColor,
                ))
          ])),
    ),
  );
}
