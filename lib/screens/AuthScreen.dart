import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hungerzzz/bloc/auth/auth_bloc.dart';
import 'package:hungerzzz/repositories/StoreRepo.dart';

import 'package:hungerzzz/screens/Wrapper.dart';
import 'package:hungerzzz/shared/consts.dart';

import '../main.dart';
import 'Home.dart';
// import 'StoreDetailsPage.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key key}) : super(key: key);
  static String id = "AuthScreen";
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isStoreExist;
  StoreRepo _storeRepo = StoreRepo();
  @override
  void initState() { 
    super.initState();
    
  }
 
  
                     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) => {
                  if (state is AuthSignedIn)
                    {
                     

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(userDetails:  state.userDetails,)))
                      
                      }
                      else if(state is AuthError)
                      {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()))
                      }
                },
            child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is AuthLoading) {
                return Container(
                  width: w(context),
                  height: h(context),
                  color: yellow,
                  child: Center(
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                    ),
                  ),
                );
              } else if (state is AuthInitial) {
                return SingleChildScrollView(
                  child: Container(
                    width: w(context),
                    height: h(context),
                    decoration: BoxDecoration(color:yellow),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: w(context),
                          height: h(context) / 1.5,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(offset: Offset(0, 1))],
                               image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.45), BlendMode.dstATop),
                  image: AssetImage("assets/images/storebg.jpg"),
                  fit: BoxFit.cover),
                              
                                     
                              color: Colors.black,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: h(context) / 3),
                              Text("Hungerzz Store",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: yellow)),
                              Text("Connect your store with Hungerzz",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                height: 50,
                              ),
                              // s
                            ],
                          ),
                        ),
                        SizedBox(height: 90),
                        Container(
                          // width: w(context)-80,
                          decoration: BoxDecoration(
                            
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black.withOpacity(.3),
                                  offset: Offset(0, 0))
                            ],
                          ),
                          child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                // side: BorderSide(),
                                  borderRadius: BorderRadius.circular(40)),
                              onPressed: () =>
                                  BlocProvider.of<AuthBloc>(context)
                                    ..add(AuthSignIn()),
                              child: Text(
                                "Sign in With Google",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 16),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              } else if (state is AuthError) {
                return Center(
                  // child: Text("${state.error}"),
                );
              } else {
                // print("error");
                return Container();
              }
            })));
  }
}
