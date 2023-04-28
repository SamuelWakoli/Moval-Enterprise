import 'package:flutter/material.dart';

class PurchasedProducts extends StatefulWidget {
  const PurchasedProducts({Key? key}) : super(key: key);

  @override
  State<PurchasedProducts> createState() => _PurchasedProductsState();
}

class _PurchasedProductsState extends State<PurchasedProducts> {
  Widget listItem() {
    return ListTile(
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
      subtitle: Text("Quantity: 1\nAmount paid: Ksh. 2000\nDate: 12/12/2022"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Purchased Products"),
      ),
      body: ListView(
        children: [listItem()],
      ),
    );
  }
}
