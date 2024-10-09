// import 'package:flutter/material.dart';
// import 'package:barcode_scan2/barcode_scan2.dart';
// import 'package:inventory_system/product_details.dart';

// import 'package:inventory_system/api_service.dart';

// class FetchPage extends StatelessWidget {
//   const FetchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ApiService apiService =
//         ApiService(baseUrl: 'https://your-api-url.com');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Product Details"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               String barcode = (await BarcodeScanner.scan()).rawContent;
//               final product = await apiService.fetchProduct(barcode);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductDetailPage(product: product),
//                 ),
//               );
//             },
//             child: Text("Scan Barcode"),
//           ),
//         ],
//       ),
//     );
//   }
// }
