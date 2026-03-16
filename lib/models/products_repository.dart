import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.accessories,
        id: 0,
        isFeatured: true,
        name: 'Vagabond sack',
        price: 120,
      ),
      Product(
        category: Category.clothing,
        id: 10,
        isFeatured: false,
        name: 'Shrug bag',
        price: 198,
      ),
      Product(
        category: Category.home,
        id: 11,
        isFeatured: false,
        name: 'Teapot',
        price: 35,
      ),
      // Puedes agregar más productos aquí siguiendo este formato
    ];

    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}