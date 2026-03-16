import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/product.dart';
import 'models/products_repository.dart';

class HomePage extends StatelessWidget {
  // 1. Agrega esta variable para recibir la categoría
  final Category category;

  // 2. Actualiza el constructor para que pida la categoría
  const HomePage({this.category = Category.all, super.key});

  List<Card> _buildGridCards(BuildContext context) {
    // 3. Usa la categoría recibida para filtrar los productos
    List<Product> products = ProductsRepository.loadProducts(category);

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
    // El resto del build se mantiene igual...
    return Scaffold(
      // Quita el AppBar de aquí si el Backdrop ya tiene uno, 
      // o déjalo si prefieres que el Home tenga el suyo propio.
      // En el Codelab 104, el AppBar suele ir en el Backdrop.
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
    );
  }
}