import 'package:flutter/material.dart';
import 'api_service.dart';

class ProductDetailPage extends StatefulWidget {
  final String barcode;

  ProductDetailPage({required this.barcode});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Future<Map<String, dynamic>> _productDetails;
  final ApiService apiService = ApiService(
      baseUrl:
          'http://192.168.20.247:8001'); // Replace with your actual API URL

  @override
  void initState() {
    super.initState();
    // Fetch product details using the barcode
    _productDetails = apiService.fetchProduct(widget.barcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _productDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name: ${product['name']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Quantity: ${product['quantity']}'),
                  SizedBox(height: 10),
                  Text('Barcode: ${product['barcode']}'),
                  // Add other product details here as needed
                ],
              ),
            );
          } else {
            return Center(child: Text('Product not found.'));
          }
        },
      ),
    );
  }
}
