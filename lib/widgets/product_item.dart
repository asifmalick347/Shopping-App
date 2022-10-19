import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
              onTap: (){
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: id);
              },
              child: Container(
                width: screenSize.width,
                height: screenSize.height *0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, size: 20, color: Theme.of(context).accentColor,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart, size: 20, color: Theme.of(context).accentColor,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
