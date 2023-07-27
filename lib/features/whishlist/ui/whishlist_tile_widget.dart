import 'package:bloc_sample_project/features/home/model/home_product.dart';
import 'package:bloc_sample_project/features/whishlist/bloc/whishlist_bloc.dart';
import 'package:flutter/material.dart';

class WhishListTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final WhishlistBloc whishlistBloc;
  const WhishListTileWidget(
      {super.key, required this.product, required this.whishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.imageUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(product.category),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      whishlistBloc.add(WishlistReomveEvent(prouduct: product));
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
