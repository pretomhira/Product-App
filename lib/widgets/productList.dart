
import 'package:flutter/material.dart';
import 'package:products/models/product.dart';

class ProductList extends StatelessWidget {
  
  final List<Product>products;

   ProductList(this.products);


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(

          itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                Text(products[index].name),
                Text(products[index].description),
                Text(products[index].quantity.toString()),
                Text(products[index].date.toString()),
              ],
            ),
          );
        },
        itemCount: products.length,
        ),
          
    );
  }
}