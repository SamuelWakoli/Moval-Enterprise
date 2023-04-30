import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  Widget listItem() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
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
            //delivered || awaiting delivery
            title: Text("Product Name"),
            subtitle: Text(
                "Quantity: 1\nAmount paid: Ksh. 2000\nDate: 12/12/2022\nStatus: Delivered"),
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
        title: const Text("Orders"),
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
        ],
      ),
    );
  }
}
