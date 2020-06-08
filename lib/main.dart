import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerzzz/bloc/bloc/cart_bloc.dart';
import 'package:hungerzzz/screens/CheckoutPage.dart';
import 'package:hungerzzz/screens/ProductPage.dart';
import 'package:hungerzzz/screens/StorePage.dart';
import 'package:hungerzzz/screens/AddressPage.dart';
import 'screens/CartPage.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(create: (_) => CartBloc()),
        ],
        child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            ProductPage.id: (context) => ProductPage(),
            StorePage.id: (context) => StorePage(),
            CartPage.id: (context) => CartPage(),
            CheckoutPage.id: (context) => CheckoutPage(),
            AddressPage.id: (context) => AddressPage(),
          },
          debugShowCheckedModeBanner: false,
          // home: Home(),
        ));
  }
}
