import 'package:flutter/material.dart';
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
        children: [
          ElevatedButton(
            onPressed: () async {
              // Scan the barcode
              var scanResult = await BarcodeScanner.scan();
              String barcode = scanResult.rawContent;

              // Navigate to product details page with the scanned barcode
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(barcode: barcode),
                ),
              );
            },
            child: Text("Scan Barcode"),
          ),
        ],
      ),
    );
  }
}
