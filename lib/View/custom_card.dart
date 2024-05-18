import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_application/Model/product_model.dart';
import 'package:store_application/View/desProduct.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;

  CustomCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDes.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                blurRadius: 4.0,
                color: Colors.white,
              )]
            ),
            child: Card(
              elevation: 2,
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 12.0,
                      end: 8.0,
                    ),
                    child: Text(
                      product.title.substring(0, 6),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      bottom: 12.0,
                      start: 12.0,
                      end: 8.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          r'$' '${product.price}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 5.0,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 90.0,
            child: CachedNetworkImage(
              imageUrl: product.image,
              height: 80,
              width: 80,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 80,
                  width: 80,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
