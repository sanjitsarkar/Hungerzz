import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/UserDetails.dart';

class AuthRepo {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserDetails> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult _authResult = await _auth.signInWithCredential(credential);
    //  accessToken: googleAuth.accessToken,
    //         idToken: googleAuth.idToken,
    assert(_authResult.user.email != null);
    assert(_authResult.user.displayName != null);
    assert(!_authResult.user.isAnonymous);
    assert(await _authResult.user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(_authResult.user.uid == currentUser.uid);
    // print(_authResult.user);
    FirebaseUser user = _authResult.user;
    return UserDetails(
      displayPic: user.photoUrl,
      email: user.email,
      uid: user.uid,
      username: user.displayName,
    );
  }

  Future logOut() 
  async
  {
      await _googleSignIn.signOut();
  await _auth.signOut();
  }

  Future<String> getUid()
  async{
    
FirebaseUser user = await _auth.currentUser();
return user.uid.toString();


  }
  Future<UserDetails> get user
async
{
  FirebaseUser firebaseUser = await  FirebaseAuth.instance.currentUser();
 UserDetails user = UserDetails(displayPic: firebaseUser.photoUrl,
 username: firebaseUser.displayName,
 email: firebaseUser.email,
 uid: firebaseUser.uid,

 );
 return user;
}

Future<bool> get isLoggedIn
async
{
  FirebaseUser user = await  FirebaseAuth.instance.currentUser();
 return user!=null;
 
}
}

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// UserDetails _getUser(FirebaseUser user) {
//   return user != null ? UserDetails(uid: user.uid) : null;
// }

// Future<UserDetails> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return UserDetails(uid: user.uid);
// }

// Future signInAnon() async {
//   try {
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     AuthResult _authResult = await _auth.signInAnonymously();

//     return _authResult;
//   } catch (e) {
//     print(e.toString());
//     return null;
//   }
// }

// Future signOutGoogle() async {
//   await googleSignIn.signOut();
//   await _auth.signOut();
// }

// Future<UserDetails> get user async {
//   FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//   UserDetails user = UserDetails(
//     displayPic: firebaseUser.photoUrl,
//     username: firebaseUser.displayName,
//     email: firebaseUser.email,
//     uid: firebaseUser.uid,
//   );
//   return user;
// }

// Future<bool> get isLoggedIn async {
//   FirebaseUser user = await FirebaseAuth.instance.currentUser();
//   return user != null;
// }
// }
