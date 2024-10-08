import 'package:flutter/material.dart';
import 'api_service.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController qtyController = TextEditingController();
    final TextEditingController barcodeController = TextEditingController();
    final ApiService apiService =
        ApiService(baseUrl: 'https://your-api-url.com');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Product Name",
            ),
          ),
          TextField(
            controller: qtyController,
            decoration: InputDecoration(
              labelText: "Qty",
            ),
          ),
          TextField(
            controller: barcodeController,
            decoration: InputDecoration(
              labelText: "Barcode",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await apiService.addProduct(
                nameController.text,
                int.parse(qtyController.text),
                barcodeController.text,
              );
              // Navigate back or show a success message
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
