import 'package:flutter/material.dart';

import '../widgets/product_details_card.dart';

class CartItemDetails extends StatefulWidget {
  const CartItemDetails({Key? key}) : super(key: key);

  @override
  State<CartItemDetails> createState() => _CartItemDetailsState();
}

class _CartItemDetailsState extends State<CartItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      icon: Icon(Icons.remove_shopping_cart_outlined,
                          color: Colors.red),
                      title: Text("Remove from Cart"),
                      content: Text("You are about to remove \$itemName "
                          "from your cart. Do you want to proceed?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              //TODO: Add logic to remove item from cart
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "\$itemName has been removed from your cart")));
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
            icon: Icon(Icons.remove_shopping_cart_outlined),
            tooltip: "Remove from cart",
          )
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                productDetailsCard(context),
                productDetailsCard(context),
                productDetailsCard(context),
                productDetailsCard(context),
                productDetailsCard(context),
              ],
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text(
              "Product Name",
              style: TextStyle(fontSize: 22),
            ),
            subtitle: Text(
              "description text description text "
              "description text description text description text "
              "description text description text"
              "description text description text ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            title: Text(
              "Ksh. 2000",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text(
                "Quaintity:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
              Text(
                "1",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Buy",
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor),
                    ),
                  ],
                )),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
