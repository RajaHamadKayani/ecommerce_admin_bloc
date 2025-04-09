import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_bloc.dart';
import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_states.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsListWidget extends StatefulWidget {
  const ProductsListWidget({super.key});

  @override
  State<ProductsListWidget> createState() => _ProductsListWidgetState();
}

class _ProductsListWidgetState extends State<ProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllProductsBloc, FetchAllProductsStates>(
      builder: (context, state) {
        switch(state.firestoreResponse.statuses){
          case Statuses.loading:
          return Center(
            child: CircularProgressIndicator(),
          );
          case Statuses.error:
          return Center(
            child: Text(state.firestoreResponse.message.toString()),
          );
          case Statuses.success:
          if(state.firestoreResponse.data.isEmpty){
            return Center(
              child: Text("No products to show",
              style: GoogleFonts.poppins(),),
            );
          }
          else{
             return ListView.builder(
            itemCount: state.firestoreResponse.data.length,
            itemBuilder: (context,index){
          return Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: ListTile(
    title: Text(
      state.firestoreResponse.data[index].name,
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
    subtitle: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.firestoreResponse.data[index].description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(fontSize: 12),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              "Price ",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            Text(
              state.firestoreResponse.data[index].price,
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ],
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            // TODO: Add your update logic here
          },
          icon: Icon(Icons.edit, color: Colors.blue),
          tooltip: 'Update',
        ),
        IconButton(
          onPressed: () {
            // TODO: Add your delete logic here
          },
          icon: Icon(Icons.delete, color: Colors.red),
          tooltip: 'Delete',
        ),
      ],
    ),
  ),
);

          });
          }
         
          default:
          return SizedBox();
        }
      },
    );
  }
}
