import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hungerzzz/models/UserDetails.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  UserDetails _getUser(FirebaseUser user) {
    return user != null ? UserDetails(uid: user.uid) : null;
  }

  Future<UserDetails> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return UserDetails(uid: user.uid);
  }

  Future signInAnon() async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      AuthResult _authResult = await _auth.signInAnonymously();

      return _authResult;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOutGoogle() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<UserDetails> get user async {
    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    UserDetails user = UserDetails(
      displayPic: firebaseUser.photoUrl,
      username: firebaseUser.displayName,
      email: firebaseUser.email,
      uid: firebaseUser.uid,
    );
    return user;
  }

  Future<bool> get isLoggedIn async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user != null;
  }
}
