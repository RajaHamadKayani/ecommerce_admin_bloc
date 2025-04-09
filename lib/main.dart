import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/config/routes/routes.dart';
import 'package:ecommerce_bloc/data/repository/add_product_repository/add_product_firestore_repository.dart';
import 'package:ecommerce_bloc/data/repository/add_product_repository/add_product_repository.dart';
import 'package:ecommerce_bloc/data/repository/fetch_products_repository/fetch_product_repository.dart';
import 'package:ecommerce_bloc/data/repository/fetch_products_repository/fetch_products_firebase_repository.dart';
import 'package:ecommerce_bloc/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure Firebase is initialized only once
  await Firebase.initializeApp(
    name: 'Ecommerce Admin',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  dependencyServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteNames.allProductsViewRoute,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}

void dependencyServices() {
  getIt.registerLazySingleton<AddProductRepository>(
      () => AddProductFirestoreRepository());
  getIt.registerLazySingleton<FetchProductRepository>(
      () => FetchProductsFirebaseRepository());
}
