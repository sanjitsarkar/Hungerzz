import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungerzzz/bloc/auth/auth_bloc.dart';
// import 'package:hungerzzz/bloc/bloc/cart_bloc.dart';
import 'package:hungerzzz/repositories/AuthRepo.dart';
import 'package:hungerzzz/screens/CheckoutPage.dart';
import 'package:hungerzzz/screens/ProductPage.dart';
import 'package:hungerzzz/screens/StorePage.dart';
import 'package:hungerzzz/screens/AddressPage.dart';
import 'package:hungerzzz/screens/Wrapper.dart';
// import 'screens/CartPage.dart';
import 'screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (_) => AuthBloc(authRepo: AuthRepo())),
        ],
        child: MaterialApp(
          initialRoute: Wrapper.id,
          routes: {
            '/': (context) => Home(),
            ProductPage.id: (context) => ProductPage(),
            StorePage.id: (context) => StorePage(),
            Wrapper.id: (context) => Wrapper(),
            CheckoutPage.id: (context) => CheckoutPage(),
            AddressPage.id: (context) => AddressPage(),
          },
          debugShowCheckedModeBanner: false,
          // home: Home(),
        ));
  }
}
