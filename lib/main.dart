import 'package:flutter/material.dart';
import 'package:store_application/Model/product_model.dart';
import 'package:store_application/View/desProduct.dart';
import 'package:store_application/View/home_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => const HomePage(),
        ProductDes.id: (context) => ProductDes(),
      },
      initialRoute: HomePage.id,
      onGenerateRoute: (settings) {
        if (settings.name == ProductDes.id) {
          final product = settings.arguments as ProductModel;
          return MaterialPageRoute(
            builder: (context) {
              return ProductDes(); // Ensure this line correctly passes the product
            },
            settings: RouteSettings(arguments: product),
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
