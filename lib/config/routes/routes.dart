import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/views/add_products_view/add_product_view.dart';
import 'package:ecommerce_bloc/views/all_products_view/all_products_view.dart';
import 'package:ecommerce_bloc/views/sign_in_view/sign_in_view.dart';
import 'package:ecommerce_bloc/views/sign_up_view/sign_up_view.dart';
import 'package:ecommerce_bloc/views/update_product_view/update_product_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.addProductViewRoute:
        return MaterialPageRoute(builder: (context) => AddProductView());
      case RouteNames.allProductsViewRoute:
        return MaterialPageRoute(builder: (context) => AllProductsView());
      case RouteNames.updateProductViewRoute:
        return MaterialPageRoute(builder: (context) => UpdateProductView());
      case RouteNames.signupViewRoute:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case RouteNames.signinViewRoute:
        return MaterialPageRoute(builder: (context) => SignInView());
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
