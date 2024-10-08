import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Product Name: ${product['name']}"),
          Text("Qty: ${product['quantity']}"),
          Text("Barcode: ${product['barcode']}"),
        ],
      ),
    );
  }
}
