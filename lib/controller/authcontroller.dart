import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/model/usermodel.dart';
import 'package:tugasakhir/view/homepage.dart';
import 'package:tugasakhir/view/loginpage.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  bool get success => false;

  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final UserModel newUser = UserModel(
          uEmail: user.email ?? '',
          uName: name,
          uId: user.uid,
        );

        _showDialog(
          context,
          'Daftar Berhasil',
          'Akun anda telah terdaftar.',
          () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          },
        );

        await userCollection.doc(newUser.uId).set(newUser.toMap());

        return newUser;
      }
    } catch (e) {
      print(e);

      _showDialog(
        context,
        'Daftar Gagal',
        'Terdapat kesalahan dalam pendaftaran.',
        () {
          Navigator.pop(context);
        },
      );
      return null;
    }
    return null;
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false,
        );
        print("Login Sukses : $email");
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Gagal Masuk'),
            content: const Text('Email atau kata sandi salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    final User? user = _auth.currentUser;
    if (user != null) {
      return UserModel.fromFirebaseUser(user);
    }
    return null;
  }

  void _showDialog(
      BuildContext context, String title, String content, VoidCallback onOk) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: const Color(0xFFD9D9D9),
          ),
          child: AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: onOk,
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
