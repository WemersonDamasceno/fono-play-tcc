import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceNotifier extends ChangeNotifier {
  final FirebaseAuth _auth;

  AuthServiceNotifier(this._auth) {
    _auth.userChanges().listen(onUserChange);
  }

  void onUserChange(User? user) {
    notifyListeners();
    print(user);
  }

  Stream<User?> get currentUser => _auth.authStateChanges();
  User? get user => _auth.currentUser;

  Future<bool> signUpUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullname,
      String? photoURL,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await changePerfil(displayName: fullname, photoURL: photoURL);
      return true;
      // return await _sendEmailVerification(context: context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'Aviso: senha fraca!');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(
            context, 'Aviso: Nome do usuário já está sendo utilizado!');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'Aviso: o usuário não foi encontrado!');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Aviso: senha incorreta!');
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> loginWithGoogle({required BuildContext context}) async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      await showSnackBar(context, e.message!);
    } catch (e) {
      await showSnackBar(context, "A operação foi mal sucedida");
      print(e);
    }
    return false;
  }

  Future<void> logout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> changePerfil(
      {String? email,
      String? password,
      String? displayName,
      String? photoURL}) async {
    try {
      if (_auth.currentUser == null) return false;
      if (email != null) await _auth.currentUser?.updateEmail(email);
      if (password != null) await _auth.currentUser?.updatePassword(password);
      if (displayName != null)
        await _auth.currentUser?.updateDisplayName(displayName);
      if (photoURL != null) await _auth.currentUser?.updatePhotoURL(photoURL);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<void> showSnackBar(BuildContext context, String menssage) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$menssage')));
  }
}
