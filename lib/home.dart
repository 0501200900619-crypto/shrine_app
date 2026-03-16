import 'package:flutter/material.dart';
import 'models/product.dart';
import 'models/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => print('Menu button'),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => print('Search button'),
          ),
        ],
      ),
      body: const Center(
        child: Text('Aquí irán los productos'),
      ),
    );
  }
}