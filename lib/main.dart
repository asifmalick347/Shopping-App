import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cart.dart';
import '/providers/products_provider.dart';
import '/screens/product_detail.dart';
import '/screens/products_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
      value: Products(),),
      ChangeNotifierProvider.value(
      value: Cart(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.purple[300],
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName:(context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
