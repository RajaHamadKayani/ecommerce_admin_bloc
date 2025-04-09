import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_bloc.dart';
import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_events.dart';
import 'package:ecommerce_bloc/config/routes/route_names.dart';
import 'package:ecommerce_bloc/main.dart';
import 'package:ecommerce_bloc/views/add_products_view/widgets/app_bar_widget.dart';
import 'package:ecommerce_bloc/views/all_products_view/widgets/products_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  late FetchAllProductsBloc fetchAllProductsBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProductsBloc=FetchAllProductsBloc(fetchProductRepository: getIt());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fetchAllProductsBloc.close();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> fetchAllProductsBloc..add(FetchProduct()),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, RouteNames.addProductViewRoute);
        },
        child: Icon(Icons.add,
        color: Colors.black,),),
        appBar: PreferredSize(preferredSize: Size(double.infinity, 60), child: AppBarWidget(title: "All Products")),
        body: ProductsListWidget(),
      ),
    );
  }
}