import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hungerzzz/models/UserDetails.dart';
import 'package:hungerzzz/repositories/AuthRepo.dart';
import 'package:meta/meta.dart';
// import 'package:firebase_auth/firebase_auth.dart;


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
 

  @override
  AuthState get initialState => AuthInitial();
  final AuthRepo _authRepo;
  String email;
 AuthBloc({@required AuthRepo authRepo}):assert(authRepo!=null),
  _authRepo=authRepo;
  UserDetails _userDetails;
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: implement mapEventToState
if(event is AppStarted)
{
  yield* _mapAppStartedToState();
}
else if(event is IsLoggedIn)
{
  yield* _mapIsLoggedInToState();
}
     else if(event is AuthSignIn)
    {
      yield* _mapAuthSignInToState();

    }
      else if(event is AuthLogOut)
    {
      yield* _mapAuthLogOutToState();

    }
  }
  Stream<AuthState> _mapAppStartedToState()
 async*{
try{
  yield AuthLoading();
  bool isLoggedIn = await _authRepo.isLoggedIn;

if(isLoggedIn)
{
_userDetails = await _authRepo.user;

yield AuthSignedIn(userDetails:_userDetails);
}
else
{
  yield AuthInitial();
}


  // yield AuthInitial(email: email);
}

//   // print("not logged in");
//   yield AuthInitial(userDetails: _userDetails);
// print("not logged in");

    

// // yield AuthSignedIn(userDetails:_userDetails );
// print(_userDetails.email);
// }
catch(e)
{
  yield AuthError(error: e.toString());
}
  }
 Stream<AuthState> _mapIsLoggedInToState()
 async*{
try{
  yield AuthLoading();
bool islogin = await _authRepo.isLoggedIn;
// yield AuthInitial(userDetails:_userDetails);
  // yield AuthInitial(email: email);
}

//   // print("not logged in");
//   yield AuthInitial(userDetails: _userDetails);
// print("not logged in");

    

// // yield AuthSignedIn(userDetails:_userDetails );
// print(_userDetails.email);
// }
catch(e)
{
  yield AuthError(error: e.toString());
}
  }


  Stream<AuthState> _mapAuthSignInToState()
  async*{
try{
  yield AuthLoading();
_userDetails = await _authRepo.signInWithGoogle();
    

yield AuthSignedIn(userDetails:_userDetails );
// print(_userDetails.email);
}
catch(e)
{
  yield AuthError(error: e.toString());
}
  }

  Stream<AuthState> _mapAuthLogOutToState()
  async*{
try{
  yield AuthLoading();
await _authRepo.logOut();
yield AuthLoggedOut();
    


// yield AuthInitial();
}
catch(e)
{
  yield AuthError(error: e.toString());
}
  }
}
