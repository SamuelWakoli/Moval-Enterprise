import 'package:flutter/material.dart';

import '../widgets/product_details_card.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_shopping_cart),
                          SizedBox(width: 10),
                          Text(
                            "Add to cart",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ))),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                      width: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined),
                          SizedBox(width: 10),
                          Text(
                            "Buy",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )))
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
