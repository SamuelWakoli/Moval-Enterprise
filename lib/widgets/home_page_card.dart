import 'package:flutter/material.dart';

Widget homePageCard({required context}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
    child: Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          //maxHeight: 300.0,
          maxWidth: 180.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                height: 160,
                child: Image.asset(
                  "assets/item.jpg",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            ListTile(
              title: Text("Product Name\nKsh. 2,000"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      tooltip: "Add to cart",
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_shopping_cart_rounded,
                        color: Theme.of(context).primaryColor,
                      )),
                  IconButton(
                      tooltip: "Details",
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outline_rounded,
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
