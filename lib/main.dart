import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import './widgets/productList.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final List<Product>_userProductInput=[
    Product(
      id: '1',
      name: 'test',
      quantity: 1,
      description: 'this is a test product',
      date:  DateTime.now()

    ),
  
  ];

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductList(_userProductInput),
            ],
          ),
        ),
      ),
    );
  }
}
