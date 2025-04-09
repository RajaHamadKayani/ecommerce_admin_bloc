import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/views/add_products_view/add_product_view.dart';
import 'package:ecommerce_bloc/views/all_products_view/all_products_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.addProductViewRoute:
        return MaterialPageRoute(builder: (context) => AddProductView());
      case RouteNames.allProductsViewRoute:
        return MaterialPageRoute(builder: (context) => AllProductsView());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          );
        });
    }
  }
}
