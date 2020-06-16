import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hungerzzz/models/UserDetails.dart';
import 'package:hungerzzz/repositories/AuthRepo.dart';
import 'package:hungerzzz/screens/AuthScreen.dart';
import 'package:hungerzzz/screens/Home.dart';
import 'package:hungerzzz/shared/consts.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);
  static String id = "Wrapper";
  @override
  Widget build(BuildContext context) {
    AuthRepo _authRepo = AuthRepo();
    return FutureBuilder<UserDetails>(
      future: _authRepo.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
                width: w(context),
                height: h(context),
                color: yellow,
                child: Center(
                    child: SpinKitCircle(
                  color: Colors.black,
                ))),
          );
        } else if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.connectionState == ConnectionState.done) {
          return Home(userDetails: snapshot.data,);
        } else if (!snapshot.hasData &&
            snapshot.data == null &&
            snapshot.connectionState == ConnectionState.done) {
          return AuthScreen();
        }
        //  else if(snapshot.hasError){
        //    print(snapshot.error);
        //   return Center(child: Text(snapshot.error
        //   .toString()),);
        // }
      },
    );
  }
}
