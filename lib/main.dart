import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import './widgets/productList.dart';
import './widgets/userInput.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Products', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> _userProductInput = [
    Product(
        id: '1',
        name: 'test',
        description: 'this is a test product',
        quantity: 1,
        date: DateTime.now()),
  ];

  void _addProduct(String newName, String newDescription, int newQuantity) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        name: newName,
        description: newDescription,
        quantity: newQuantity,
        date: DateTime.now());

    setState(() {
      _userProductInput.add(newProduct);
    });
  }

  void _startAddNewProduct(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: UserInput(_addProduct),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewProduct(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
