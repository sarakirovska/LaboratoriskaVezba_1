import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '211154', // Твојот индекс како наслов на апликацијата
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0), // Use bodyLarge instead of bodyText1
          bodyMedium: TextStyle(fontSize: 14.0), // Use bodyMedium instead of bodyText2
        ),
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  final List<Map<String, String>> products = [
    {"image": "assets/tshirt.jpg", "name": "T-Shirt", "price": "2000", "description": "Комфорна маица за секојдневно носење."},
    {"image": "assets/shoes.jpg", "name": "Shoes", "price": "5000", "description": "Квалитетни обувки за долги прошетки."},
    {"image": "assets/hat.jpg", "name": "Hat", "price": "1500", "description": "Модерен шешир за секој стил."},
    {"image": "assets/bag.jpg", "name": "Bag", "price": "3000", "description": "Практична чанта за секојдневно користење."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211154'), // Твојот индекс како наслов на AppBar
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the Product Details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: products[index],
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset(products[index]['image']!, height: 300, width: 300),
                  Text(products[index]['name']!),
                  Text('${products[index]['price']} ден'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(product['image']!, height: 300, width: 300),
            const SizedBox(height: 20),
            Text(
              product['name']!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              'Цена: ${product['price']} ден',
              style: Theme.of(context).textTheme.bodyLarge,  
            ),
            const SizedBox(height: 10),
            Text(
              product['description']!,
              style: Theme.of(context).textTheme.bodyMedium,  
            ),
          ],
        ),
      ),
    );
  }
}
