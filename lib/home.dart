import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/product.dart';
import 'models/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Método para crear las tarjetas de los productos
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: theme.textTheme.titleLarge,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    formatter.format(product.price),
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

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
      // El GridView.count crea la cuadrícula
      body: GridView.count(
        crossAxisCount: 2, // Dos columnas
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0, // Proporción de las tarjetas
        children: _buildGridCards(context),
      ),
    );
  }
}