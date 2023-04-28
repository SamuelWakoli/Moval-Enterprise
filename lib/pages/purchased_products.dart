import 'package:flutter/material.dart';

class PurchasedProducts extends StatefulWidget {
  const PurchasedProducts({Key? key}) : super(key: key);

  @override
  State<PurchasedProducts> createState() => _PurchasedProductsState();
}

class _PurchasedProductsState extends State<PurchasedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Purchased Products"),
      ),
    );
  }
}
