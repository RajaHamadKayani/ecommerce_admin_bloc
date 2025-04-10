import 'package:ecommerce_bloc/bloc/delete_product_bloc/delete_product_bloc.dart';
import 'package:ecommerce_bloc/bloc/delete_product_bloc/delete_product_event.dart';
import 'package:ecommerce_bloc/bloc/delete_product_bloc/delete_product_states.dart';
import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_bloc.dart';
import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_events.dart';
import 'package:ecommerce_bloc/bloc/fetch_all_products_bloc/fetch_all_products_states.dart';
import 'package:ecommerce_bloc/utils/enums.dart';
import 'package:ecommerce_bloc/utils/extensions/flushbar_helper.dart';
import 'package:ecommerce_bloc/views/update_product_view/update_product_view.dart';
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
    return BlocListener<DeleteProductBloc, DeleteProductState>(
      listener: (context, state) {
        if (state.statuses == Statuses.error) {
          FlushbarHelper.errorMessageFlushBar(
              state.message.toString(), context);
        } else if (state.statuses == Statuses.loading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(child: CircularProgressIndicator(color: Colors.black,));
            },
          );
        } else if (state.statuses == Statuses.success) {
          // Dismiss the loading dialog and show success
          Navigator.pop(context);
          FlushbarHelper.successMessageFlushBar(
              state.message.toString(), context);
          context.read<FetchAllProductsBloc>().add(FetchProduct());
        }
      },
      child: BlocBuilder<FetchAllProductsBloc, FetchAllProductsStates>(
        builder: (context, state) {
          switch (state.firestoreResponse.statuses) {
            case Statuses.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case Statuses.error:
              return Center(
                child: Text(state.firestoreResponse.message.toString()),
              );
            case Statuses.success:
              if (state.firestoreResponse.data.isEmpty) {
                return Center(
                  child: Text(
                    "No products to show",
                    style: GoogleFonts.poppins(),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: state.firestoreResponse.data.length,
                    itemBuilder: (context, index) {
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
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateProductView(
                                                id: state.firestoreResponse
                                                    .data[index].id,
                                                currentName: state
                                                    .firestoreResponse
                                                    .data[index]
                                                    .name,
                                                currentDescription: state
                                                    .firestoreResponse
                                                    .data[index]
                                                    .description,
                                                currentPrice: state
                                                    .firestoreResponse
                                                    .data[index]
                                                    .price,
                                                currentQuantity: state
                                                    .firestoreResponse
                                                    .data[index]
                                                    .quantity,
                                              )));
                                },
                                icon: Icon(Icons.edit, color: Colors.blue),
                                tooltip: 'Update',
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<DeleteProductBloc>()
                                      .add(DeleteSpecificProduct(
                                        productId: state
                                            .firestoreResponse.data[index].id,
                                      ));
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
      ),
    );
  }
}
