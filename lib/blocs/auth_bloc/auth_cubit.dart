import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thefurqan/screens/auth/auth_toggle.dart';
import 'package:thefurqan/src/data/app_navigator.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  bool? isLogging;
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  registerUser(BuildContext context) async {
    if (email.text.isEmpty || password.text.isEmpty || name.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              const AlertDialog(content: Text("Some or all fields are empty")));
    } else {
      try {
        emit(AuthInitial());
        await _auth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) => _firestore
                    .collection('users')
                    .doc(
                      _auth.currentUser!.uid,
                    )
                    .set({
                  'name': name.text,
                  'email': email.text,
                  'uid': _auth.currentUser!.uid,
                  'date_created': DateTime.now(),
                  'last_access': DateTime.now()
                }));
        emit(AuthSuccess());
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                content: Text(e.toString().replaceAll('[firebase_auth/', ''))));
      }
    }
  }

  loginUser(BuildContext context) async {
    if (email.text.isEmpty || password.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              const AlertDialog(content: Text("Some or all fields are empty")));
    } else {
      try {
        emit(AuthInitial());
        await _auth.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        emit(AuthSuccess());
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                content: Text(e.toString().replaceAll('[firebase_auth/', ''))));
      }
    }
  }

  logoutUser(BuildContext context) {
    try {
      _firestore
          .collection('users')
          .doc(
            _auth.currentUser!.uid,
          )
          .update({'last_access': DateTime.now()})
          .then((value) => _auth.signOut())
          .then((value) => AppNavigator.pushR(context, const AuthToggle()));
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              content: Text(e.toString().replaceAll('[firebase_auth/', ''))));
    }
  }
}
