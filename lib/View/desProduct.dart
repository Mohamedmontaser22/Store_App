import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_application/Model/product_model.dart';

class ProductDes extends StatelessWidget {
  static const String id = "ProductDes";

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.image,
                    height: 200,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 200, // Match the image height for consistency
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                product.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Price: ',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${product.price} \$',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ), // Add some spacing between price and rating
                  RatingBar.builder(
                    initialRating: (product.rating?.rate ?? 0.0)
                        .toDouble(), // Ensure this is a double
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                product.description,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20), // Adjust spacing as needed
              //  GestureDetector(
              //  onTap: () {
              //     // Add your onTap logic here
              //     },
              // child: Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   decoration: BoxDecoration(
              //     color: Colors.cyan,
              //     borderRadius: BorderRadius.circular(32),
              //   ),
              //    child: Center(
              //     child: Text(
              //       'Update this product',
              //       style: TextStyle(
              //       color: Colors.white,
              //        fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //       ),
              //     ),
              //    ),
              //   ),
              //  ),
              SizedBox(height: 20), // Additional spacing to prevent overflow
            ],
          ),
        ),
      ),
    );
  }
}
