import 'package:gettogether/domain/repository/UserRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gettogether/domain/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUserRepository extends UserRepository {
  final _googleSignIn = new GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  Future<User> signUpWithGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser _firebaseUser = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + _firebaseUser.displayName);
    var userId = UserId(_firebaseUser.uid);
    var _user = User(id: userId, name: _firebaseUser.displayName);
    return _user;
  }

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser _firebaseUser = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + _firebaseUser.displayName);
    var userId = UserId(_firebaseUser.uid);
    var _user = User(id: userId, name: _firebaseUser.displayName);
    return _user;
  }
}
