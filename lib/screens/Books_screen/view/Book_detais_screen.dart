import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_care_clinic/core/Colors.dart';
import 'package:v_care_clinic/screens/Books_screen/view_model/showbook_view_model/show_book_cubit.dart';

class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({Key? key, required this.id}) : super(key: key);
  int id;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowBookCubit, ShowBookState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShowBookCubit.get(context);
        return cubit.showBookModel!.data != null ?
        Scaffold(
                appBar: AppBar(
                  title: Text('Book Details'),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          cubit.showBookModel!.data!
                              .image!, // Replace with actual image URL
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 16),
                        Text(
                          cubit.showBookModel!.data!.name!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              cubit.showBookModel!.data!.category!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  cubit.showBookModel!.data!.price!,
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  cubit.showBookModel!.data!.priceAfterDiscount!
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: mainColor
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          cubit.showBookModel!.data!.description!,
                          style: TextStyle(fontSize: 20, color: Colors.black45),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            fixedSize: Size.fromHeight(50),
                          ),
                          onPressed: () {
                            // Add to cart logic
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }
}
