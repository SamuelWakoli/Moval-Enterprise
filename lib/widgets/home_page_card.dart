import 'package:flutter/material.dart';
import 'package:moval/pages/product_detail.dart';
import 'package:moval/utils/ids.dart';
import 'package:moval/utils/navigation.dart';

Widget homePageCard({required context}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 188.0,
        ),
        child: InkWell(
          onTap: () {
            CURRENT_PRODUCT_ID = ""; // TODO: change this
            nextPage(context: context, page: ProductDetails());
          },
          splashColor: Theme.of(context).primaryColor,
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
              )
            ],
          ),
        ),
      ),
    ),
  );
}
