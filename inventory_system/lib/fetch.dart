import 'package:flutter/material.dart';
// import the camera and the barcode scanner packages
import 'package:camera/camera.dart';
// import simple scanner
import 'package:barcode_scan2/barcode_scan2.dart';

import 'product_details.dart';

class FetchPage extends StatelessWidget {
  const FetchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: Column(
          //scan the barcode
          children: [
            ElevatedButton(
              onPressed: () async {
                // scan the barcode
                String barcode = (await BarcodeScanner.scan()) as String;
                // navigate to product details page
                MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                          product: {},
                        ));
              },
              child: Text("Scan Barcode"),
            ),
          ]),
    );
  }
}
