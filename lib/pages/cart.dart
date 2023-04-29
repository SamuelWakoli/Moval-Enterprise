import 'package:flutter/material.dart';
import 'package:moval/utils/ids.dart';
import 'package:moval/utils/navigation.dart';

import 'cart_item_details.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget listItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              //TODO: assign ID for cart item details
              CURRENT_PRODUCT_ID = "";
              nextPage(context: context, page: const CartItemDetails());
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  "assets/item.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text("Product Name"),
            subtitle: Text("Quantity: 1\nTotal cost: Ksh. 2000"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart"),
        elevation: 1,
      ),
      body: ListView(
        children: [
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
          listItem(),
        ],
      ),
    );
  }
}
