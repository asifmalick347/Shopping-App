import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/product.dart';
import '/screens/product_detail.dart';

import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({
  //   @required this.id,
  //   @required this.title,
  //   @required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      elevation: 2,
      child: Container(
        width: screenSize.width * 0.25,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 254, 229, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                    arguments: product.id);
              },
              child: Container(
                width: screenSize.width,
                height: screenSize.height * 0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Consumer<Product>(
                  builder: (context, value, _) => IconButton(
                    onPressed: () {
                      product.toggleIsFavoriteStatus();
                    },
                    icon: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cart.addCartItems(product.id, product.price, product.title);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
